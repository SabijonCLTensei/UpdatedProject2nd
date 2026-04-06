const pool = require('../config/db');
const userController = require('./userController');

exports.getNotes = async (req, res) => {
    const { user_id, search, searchBy } = req.query;
    try {
        let query = `
            SELECT 
                n.*, 
                c.name as category_name,
                r.reminder_time,
                r.status as reminder_status,
                (SELECT GROUP_CONCAT(t.name) FROM TAG t JOIN NOTE_TAG nt ON t.tag_id = nt.tag_id WHERE nt.note_id = n.note_id) as tags,
                (SELECT COUNT(*) FROM COMMENT WHERE note_id = n.note_id) as comment_count
            FROM NOTE n 
            LEFT JOIN CATEGORY c ON n.category_id = c.category_id 
            LEFT JOIN REMINDER r ON n.note_id = r.note_id
            WHERE n.user_id = ? 
        `;
        const params = [user_id];

        if (search) {
            if (searchBy === 'title') {
                query += ' AND n.title LIKE ?';
                params.push(`%${search}%`);
            } else if (searchBy === 'content') {
                query += ' AND n.content LIKE ?';
                params.push(`%${search}%`);
            } else if (searchBy === 'category') {
                query += ' AND c.name LIKE ?';
                params.push(`%${search}%`);
            } else if (searchBy === 'tags') {
                query += ' AND n.note_id IN (SELECT nt.note_id FROM NOTE_TAG nt JOIN TAG t ON nt.tag_id = t.tag_id WHERE t.name LIKE ?)';
                params.push(`%${search}%`);
            } else {
                query += ' AND (n.title LIKE ? OR n.content LIKE ?)';
                params.push(`%${search}%`, `%${search}%`);
            }
        }

        query += ' ORDER BY n.created_at DESC';
        const [rows] = await pool.query(query, params);
        res.json(rows);
    } catch (error) {
        res.status(500).json({ error: error.message });
    }
};

exports.saveNote = async (req, res) => {
    const { note_id, user_id, title, content, category_id, pinned, archived } = req.body;
    try {
        if (note_id) {
            await pool.query(
                'UPDATE NOTE SET title = ?, content = ?, category_id = ?, pinned = ?, archived = ? WHERE note_id = ? AND user_id = ?',
                [title, content, category_id, pinned, archived, note_id, user_id]
            );
            await userController.logActivity(user_id, 'UPDATE_NOTE', `Updated note: ${title}`);
            res.json({ message: 'Note updated' });
        } else {
            const [result] = await pool.query(
                'INSERT INTO NOTE (user_id, title, content, category_id, pinned, archived) VALUES (?, ?, ?, ?, ?, ?)',
                [user_id, title, content, category_id, pinned, archived]
            );
            await userController.logActivity(user_id, 'CREATE_NOTE', `Created note: ${title}`);
            res.status(201).json({ note_id: result.insertId });
        }
    } catch (error) {
        res.status(500).json({ error: error.message });
    }
};

exports.deleteNote = async (req, res) => {
    const { id } = req.params;
    const { user_id } = req.query;
    try {
        await pool.query('DELETE FROM NOTE WHERE note_id = ? AND user_id = ?', [id, user_id]);
        await userController.logActivity(user_id, 'DELETE_NOTE', `Deleted note ID: ${id}`);
        res.json({ message: 'Note deleted' });
    } catch (error) {
        res.status(500).json({ error: error.message });
    }
};
