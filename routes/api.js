var express = require("express");
var router = express.Router();

var usersAPI = require("../api/users");
router.use("/users", usersAPI);

var pointAPI = require("../api/points");
router.use("/points", pointAPI);

var ordersAPI = require("../api/orders");
router.use("/orders", ordersAPI);

var favAPI = require("../api/fav");
router.use("/fav", favAPI);

var commentAPI = require("../api/comment");
router.use("/comment", commentAPI);

var orderviewAPI = require("../api/orderview");
router.use("/orderview", orderviewAPI);

var avatarAPI = require("../api/avatar");
router.use("/avatar", avatarAPI);

module.exports = router;
