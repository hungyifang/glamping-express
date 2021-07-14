const express = require("express");
const router = express.Router();
const conn = require("../utils/db");

router.put("/edit/:id", async (req, res, next) => {
  await conn.query(`UPDATE users \
    SET username = '${req.query.username}', password = '${req.query.password}', email = '${req.query.email}', tel = '${req.query.tel}', visited = NOW() \
    WHERE u_id =  ${req.params.id}`);
  res.json({ msg: "編輯成功" });
});

router.get("/:id", async (req, res, next) => {
  let result = await conn.query(
    `SELECT * FROM users WHERE u_id = ${req.params.id}`
  );
  res.json(result[0]);
});

router.get("/", async (req, res, next) => {
  let result = await conn.query(`SELECT * FROM users`);
  res.json(result[0]);
});

module.exports = router;
