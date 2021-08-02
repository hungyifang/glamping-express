const express = require("express");
const router = express.Router();
const usersController = require("../controllers/users");

router.get("/logout", usersController.logout);
router.get("/check", usersController.isLoggedIn);
router.post("/login", usersController.login);

module.exports = router;