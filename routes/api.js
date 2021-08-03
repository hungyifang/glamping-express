var express = require("express");
var router = express.Router();

var eventAPI = require("../api/event");
var authAPI = require("../api/auth");

// Yuna
var usersAPI = require("../api/users");
var pointAPI = require("../api/points");
var ordersAPI = require("../api/orders");
var favAPI = require("../api/fav");
var commentAPI = require("../api/comment");
var orderviewAPI = require("../api/orderview");
var avatarAPI = require("../api/avatar");

// Fang
var eventAPI = require("../api/event");

router.use("/auth", authAPI);
router.use("/users", usersAPI);
router.use("/event", eventAPI);
router.use("/points", pointAPI);
router.use("/orders", ordersAPI);
router.use("/fav", favAPI);
router.use("/comment", commentAPI);
router.use("/orderview", orderviewAPI);
router.use("/avatar", avatarAPI);
router.use("/event", eventAPI);

module.exports = router;
