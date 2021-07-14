var express = require("express");
var router = express.Router();

var usersAPI = require("../api/users");

router.use("/users", usersAPI);

module.exports = router;
