const express = require('express');
const router = express.Router();
const extraController = require('../controllers/extraController');

router.get('/tags', extraController.getTags);
router.post('/tags', extraController.addTagToNote);

router.get('/comments/:note_id', extraController.getComments);
router.post('/comments', extraController.saveComment);

router.post('/reminders', extraController.saveReminder);
router.post('/share', extraController.shareNote);
router.post('/attachments', extraController.addAttachment);
router.post('/email', extraController.emailNote);
router.get('/sync', extraController.syncGmail);

module.exports = router;
