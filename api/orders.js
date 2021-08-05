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
  await conn.query(
    `UPDATE ordered SET s_id = "99" WHERE o_id = ${req.params.o_id}`
  );
  res.json({ msg: "訂單已取消" });
});
router.post("/", async (req, res, next) => {
  if (req.body[0].u_id === "") {
    await conn.query(
      `INSERT INTO ordered (total, level, person, start, end, s_id, prime, title, message) VALUES (?)`,
      [
        [
          req.body[0].total,
          req.body[0].level,
          req.body[0].person,
          req.body[0].start,
          req.body[0].end,
          req.body[0].s_id,
          req.body[0].prime,
          req.body[0].title,
          req.body[0].message,
        ],
      ]
    );
    res.json({ msg: "編輯成功" });
  } else {
    await conn.query(
      `INSERT INTO ordered (u_id, total, level, person, start, end, s_id, prime, title, message) VALUES (?)`,
      [
        [
          req.body[0].u_id,
          req.body[0].total,
          req.body[0].level,
          req.body[0].person,
          req.body[0].start,
          req.body[0].end,
          req.body[0].s_id,
          req.body[0].prime,
          req.body[0].title,
          req.body[0].message,
        ],
      ]
    );
    res.json({ msg: "編輯成功" });
  }
});
router.post("/detail", async (req, res, next) => {
  // console.log(req.body)

  req.body.forEach(async (e) => {
    await conn.query(
      `INSERT INTO ordered_detail (o_id, i_id, price, quantity, ship_date) VALUES (?)`,
      [[e.o_id, e.i_id, e.price, e.quantity, e.ship_date]]
    );
  });
  res.json({ msg: "編輯成功" });
});

router.get("/o_id", async (req, res, next) => {
  let result = await conn.query(
    `SELECT o_id FROM ordered ORDER BY created DESC LIMIT 1`
  );
  res.json(result[0]);
});
router.delete("/delete", async (req, res, next) => {
  // console.log(req.body)

  for (let i = 0; i < req.body.length; i++) {
    await conn.query(`DELETE FROM ordered WHERE o_id = ${req.body[i].o_id}`);
  }
  res.json({ msg: "編輯成功" });
});

module.exports = router;
