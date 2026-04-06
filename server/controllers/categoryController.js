const pool = require('../config/db');
const userController = require('./userController');

exports.getCategories = async (req, res) => {
    try {
        const [rows] = await pool.query('SELECT * FROM CATEGORY');
        res.json(rows);
    } catch (error) {
        res.status(500).json({ error: error.message });
    }
};

exports.saveCategory = async (req, res) => {
    const { name, user_id } = req.body;
    try {
        await pool.query('INSERT IGNORE INTO CATEGORY (name) VALUES (?)', [name]);
        if (user_id) {
            await userController.logActivity(user_id, 'CREATE_CATEGORY', `Created category: ${name}`);
        }
        res.status(201).json({ message: 'Category saved' });
    } catch (error) {
        res.status(500).json({ error: error.message });
    }
};
