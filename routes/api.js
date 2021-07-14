var express = require("express");
var router = express.Router();

var usersAPI = require("../api/users");
var eventAPI = require("../api/event");

router.use("/users", usersAPI);
router.use("/event", eventAPI);

module.exports = router;
