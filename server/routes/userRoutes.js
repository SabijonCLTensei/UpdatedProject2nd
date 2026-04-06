const express = require('express');
const router = express.Router();
const userController = require('../controllers/userController');

router.post('/login', userController.login);
router.post('/register', userController.register);
router.post('/revert-password', userController.revertPassword);
router.get('/activity/:user_id', userController.getActivityLog);
router.get('/help', userController.getHelp);
router.get('/all-users', userController.getAllUsers);
router.delete('/:user_id', userController.deleteUser);
router.put('/:user_id', userController.updateUser);

module.exports = router;
