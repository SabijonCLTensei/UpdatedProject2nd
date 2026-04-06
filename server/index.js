const express = require('express');
const cors = require('cors');
const path = require('path');
require('dotenv').config();

const noteRoutes = require('./routes/noteRoutes');
const categoryRoutes = require('./routes/categoryRoutes');
const extraRoutes = require('./routes/extraRoutes');
const userRoutes = require('./routes/userRoutes');

const app = express();
const PORT = process.env.PORT || 5001;

app.use(cors());
app.use(express.json());

// Serve static files from the client directory
app.use(express.static(path.join(__dirname, '../client')));

app.use('/api/notes', noteRoutes);
app.use('/api/categories', categoryRoutes);
app.use('/api/extra', extraRoutes);
app.use('/api/users', userRoutes);

// Route all other requests to index.html
app.get('*', (req, res) => {
    res.sendFile(path.join(__dirname, '../client/index.html'));
});

app.listen(PORT, () => {
    console.log(`Server running on http://localhost:${PORT}`);
});
