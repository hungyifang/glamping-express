const express = require("express");
const router = express.Router();
const conn = require("../utils/db");

router.get("/history/:id", async (req, res, next) => {
  let result = await conn.query(
    `SELECT * FROM users_points WHERE u_id = ${req.params.id} AND expired >= NOW()`
  );
  res.json(result[0]);
});

router.get("/history/:id/expired", async (req, res, next) => {
  let result = await conn.query(
    `SELECT * FROM users_points WHERE u_id = ${req.params.id} AND expired < NOW()`
  );
  res.json(result[0]);
});
router.put("/pointUpdate", async (req, res, next) => {
  await conn.query(`UPDATE users SET points = ${req.body[0].points} WHERE u_id = ${req.body[0].u_id}`);
  

  res.json({ msg: "點數已更新" });
});

module.exports = router;
