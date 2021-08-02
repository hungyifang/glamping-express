const express = require("express");
const router = express.Router();
const conn = require("../utils/db");

router.get("/:id", async (req, res, next) => {
  let favResult = await conn.query(
    `SELECT * FROM items JOIN users_likes ON items.i_id = users_likes.i_id  WHERE users_likes.u_id = ${req.params.id} AND users_likes.able=1 ORDER BY created DESC`
  );
  res.json(favResult[0]);
});

router.post("/:u_id/:i_id", async (req, res, next) => {
  try {
    await conn.query(
      `UPDATE users_likes SET able='${req.body.able}' WHERE u_id=${req.params.u_id} AND i_id=${req.params.i_id}`
    );
    res.json({ msg: "已取消收藏", status: 1 });
  } catch {
    res.json({ msg: "取消收藏失敗", status: 0 });
  }
});

module.exports = router;
