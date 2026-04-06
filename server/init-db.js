const mysql = require('mysql2/promise');
const fs = require('fs');
const path = require('path');
require('dotenv').config();

async function initDB() {
    const connection = await mysql.createConnection({
        host: process.env.DB_HOST,
        user: process.env.DB_USER,
        password: process.env.DB_PASSWORD,
        multipleStatements: true
    });

    console.log('Connected to MySQL server.');

    const schema = fs.readFileSync(path.join(__dirname, 'schema.sql'), 'utf8');
    
    // Using multipleStatements: true allows us to run the whole schema at once
    await connection.query(schema);

    console.log('Database initialized successfully.');
    await connection.end();
}

initDB().catch(err => {
    console.error('Error initializing database:', err);
    process.exit(1);
});
