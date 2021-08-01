const express = require("express");
const router = express.Router();
const conn = require("../utils/db");

router.get("/:id", async (req, res, next) => {
  let commentResult = await conn.query(
    `SELECT * FROM discuss WHERE use_by = "o" AND external_id = ${req.params.id}`
  );
  res.json(commentResult[0]);
});

router.post("/:id", async (req, res, next) => {
  let commentResult = await conn.query(
    `SELECT * FROM discuss WHERE use_by = "o" AND external_id = ${req.params.id}`
  );
  if (commentResult[0].length === 1) {
    await conn.query(
      `UPDATE discuss SET title = '${req.body.title}', article = '${req.body.article}', score = '${req.body.score}', updated = NOW() WHERE use_by = "o" AND external_id = ${req.params.id}`
    );
    res.json({ msg: "評論已修改" });
  } else {
    await conn.query(
      `INSERT INTO discuss (u_id, use_by, external_id, title, article, score, updated) VALUES ('${req.body.u_id}', 'o', '${req.body.o_id}', '${req.body.title}', '${req.body.article}', '${req.body.score}', NOW())`
    );
    res.json({ msg: "評論已新增" });
  }
});

module.exports = router;
