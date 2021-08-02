const express = require("express");
const router = express.Router();
const conn = require("../utils/db");

router.get("/:u_id/:s_id", async (req, res, next) => {
  let orderedResult = await conn.query(
    `SELECT * FROM ordered WHERE u_id = ${req.params.u_id} AND s_id = ${req.params.s_id} ORDER BY created DESC`
  );
  res.json(orderedResult[0]);
});

router.put("/:o_id", async (req, res, next) => {
  await conn.query(`UPDATE ordered SET s_id = "99" WHERE o_id = ${req.params.o_id}`);
    res.json({ msg: "訂單已取消" });
  });

module.exports = router;
