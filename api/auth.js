const express = require("express");
const conn = require("../utils/db");
const router = express.Router();
const usersController = require("../controllers/users");
const twofactor = require("node-2fa");

router.get("/logout", usersController.logout);
router.get("/check", usersController.isLoggedIn);
router.post("/login", usersController.login);

// router.get("/newtotp", (req, res) => {
//   const newSecret = twofactor.generateSecret({
//     name: "山角行",
//     account: req.body.username,
//   });
//   console.log(newSecret);
//   res.json(newSecret);
// });

router.post("/signup", async (req, res) => {
  const row = await conn.query(
    `SELECT * FROM users WHERE username="${req.body.username}"`
  );
  console.log(row[0].length);
  if (row[0].length === 0) {
    console.log("可註冊");
    // CREATE A TOTP CODE
    const totp = twofactor.generateSecret({
      name: "山角行",
      account: req.body.username,
    });
    // CREATE A USER
    await conn.query(
      `INSERT INTO users (username, password, totp)  VALUES (?)`,
      [[req.body.username, req.body.password, totp.secret]]
    );
    res.json({
      status: 1,
      username: req.body.username,
      totp_uri: totp.uri,
      totp_qr: totp.qr,
      msg: "註冊成功",
    });
  } else {
    console.log("使用者名稱已被註冊");
    res.json({ status: 0, msg: "使用者名稱已被註冊" });
  }
});

module.exports = router;
