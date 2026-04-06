const pool = require('../config/db');
const nodemailer = require('nodemailer');
const imaps = require('imap-simple');
const userController = require('./userController');

// --- TAGS ---
exports.getTags = async (req, res) => {
    try {
        const [rows] = await pool.query('SELECT * FROM TAG');
        res.json(rows);
    } catch (error) {
        res.status(500).json({ error: error.message });
    }
};

exports.addTagToNote = async (req, res) => {
    const { note_id, user_id, tag_name } = req.body;
    try {
        await pool.query('INSERT IGNORE INTO TAG (name) VALUES (?)', [tag_name]);
        const [[tag]] = await pool.query('SELECT tag_id FROM TAG WHERE name = ?', [tag_name]);
        await pool.query('INSERT IGNORE INTO NOTE_TAG (note_id, tag_id) VALUES (?, ?)', [note_id, tag.tag_id]);
        if (user_id) {
            await userController.logActivity(user_id, 'ADD_TAG', `Added tag #${tag_name} to note ID: ${note_id}`);
        }
        res.status(201).json({ message: 'Tag added' });
    } catch (error) {
        res.status(500).json({ error: error.message });
    }
};

// --- COMMENTS ---
exports.getComments = async (req, res) => {
    const { note_id } = req.params;
    try {
        const [rows] = await pool.query('SELECT c.*, u.username FROM COMMENT c JOIN USER u ON c.user_id = u.user_id WHERE c.note_id = ? ORDER BY c.created_at DESC', [note_id]);
        res.json(rows);
    } catch (error) {
        res.status(500).json({ error: error.message });
    }
};

exports.saveComment = async (req, res) => {
    const { note_id, user_id, content } = req.body;
    try {
        if (!user_id) return res.status(400).json({ error: "User ID required" });
        await pool.query('INSERT INTO COMMENT (note_id, user_id, content) VALUES (?, ?, ?)', [note_id, user_id, content]);
        await userController.logActivity(user_id, 'ADD_COMMENT', `Added comment to note ID: ${note_id}`);
        res.status(201).json({ message: 'Comment added' });
    } catch (error) {
        res.status(500).json({ error: error.message });
    }
};

// --- REMINDERS ---
exports.saveReminder = async (req, res) => {
    const { note_id, reminder_time } = req.body;
    try {
        await pool.query('INSERT INTO REMINDER (note_id, reminder_time) VALUES (?, ?) ON DUPLICATE KEY UPDATE reminder_time = ?, status = "pending"', [note_id, reminder_time, reminder_time]);
        res.status(201).json({ message: 'Reminder set' });
    } catch (error) {
        res.status(500).json({ error: error.message });
    }
};

// --- SHARING ---
exports.shareNote = async (req, res) => {
    const { note_id, target_username, permission } = req.body;
    try {
        const [[user]] = await pool.query('SELECT user_id FROM USER WHERE username = ?', [target_username]);
        if (!user) return res.status(404).json({ error: 'User not found' });
        await pool.query('INSERT INTO SHARE (note_id, user_id, permission) VALUES (?, ?, ?)', [note_id, user.user_id, permission]);
        res.status(201).json({ message: 'Note shared' });
    } catch (error) {
        res.status(500).json({ error: error.message });
    }
};

// --- ATTACHMENTS ---
exports.addAttachment = async (req, res) => {
    const { note_id, file_path, file_type } = req.body;
    try {
        await pool.query('INSERT INTO ATTACHMENT (note_id, file_path, file_type) VALUES (?, ?, ?)', [note_id, file_path, file_type]);
        res.status(201).json({ message: 'Attachment added' });
    } catch (error) {
        res.status(500).json({ error: error.message });
    }
};

// --- GMAIL SYNC ---
exports.syncGmail = async (req, res) => {
    const { user_id, email } = req.query;
    
    // Check if the user is authorized to sync this email
    // In this app, we only allow syncing the dev's email for simplicity
    if (email !== process.env.EMAIL_USER) {
        return res.status(403).json({ error: "Gmail Sync is only enabled for the primary developer account: " + process.env.EMAIL_USER });
    }

    const config = {
        imap: {
            user: process.env.EMAIL_USER,
            password: process.env.EMAIL_PASS,
            host: 'imap.gmail.com',
            port: 993,
            tls: true,
            tlsOptions: { rejectUnauthorized: false },
            authTimeout: 10000
        }
    };

    try {
        const connection = await imaps.connect(config);
        await connection.openBox('INBOX');
        
        // Search for emails from the last 7 days to keep it fast
        const delay = 7 * 24 * 3600 * 1000;
        const yesterday = new Date();
        yesterday.setTime(Date.now() - delay);
        const searchCriteria = [['SINCE', yesterday.toISOString()]];
        const fetchOptions = { bodies: ['HEADER', 'TEXT'], struct: true };
        
        const messages = await connection.search(searchCriteria, fetchOptions);
        let importedCount = 0;

        for (let msg of messages) {
            const headerPart = msg.parts.find(p => p.which === 'HEADER');
            const subject = headerPart.body.subject ? headerPart.body.subject[0] : '';
            
            if (subject.toUpperCase().startsWith('NOTE:')) {
                const title = subject.substring(5).trim() || "Synced Note";
                const bodyPart = msg.parts.find(p => p.which === 'TEXT');
                let content = bodyPart ? bodyPart.body : '';

                // Basic cleaning if it's multipart or has extra whitespace
                content = content.trim();

                // Check if note already exists to avoid duplicates
                const [[existing]] = await pool.query(
                    'SELECT note_id FROM NOTE WHERE user_id = ? AND title = ? AND content = ?',
                    [user_id, title, content]
                );

                if (!existing) {
                    await pool.query(
                        'INSERT INTO NOTE (user_id, title, content) VALUES (?, ?, ?)',
                        [user_id, title, content]
                    );
                    importedCount++;
                }
            }
        }

        connection.end();
        res.json({ message: `Sync Complete! Imported ${importedCount} new notes from your Gmail.` });

    } catch (error) {
        console.error("Gmail Sync Error:", error);
        res.status(500).json({ 
            error: "Failed to connect to Gmail.",
            details: "Ensure IMAP is enabled in Gmail settings AND you are using a 16-character 'App Password', NOT your regular Gmail password."
        });
    }
};

exports.emailNote = async (req, res) => {
    const { note_id, email } = req.body;
    try {
        const [[note]] = await pool.query('SELECT * FROM NOTE WHERE note_id = ?', [note_id]);
        if (!note) return res.status(404).json({ error: 'Note not found' });
        
        const transporter = nodemailer.createTransport({
            service: 'gmail',
            auth: {
                user: process.env.EMAIL_USER,
                pass: process.env.EMAIL_PASS
            }
        });

        const mailOptions = {
            from: process.env.EMAIL_USER,
            to: email,
            subject: `Shared Note: ${note.title}`,
            text: `Content:\n${note.content}`
        };

        await transporter.sendMail(mailOptions);
        res.json({ message: `Note successfully sent to ${email}!` });
    } catch (error) {
        res.status(500).json({ error: "Email failed: " + error.message });
    }
};
