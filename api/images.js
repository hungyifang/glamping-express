const express = require("express");
const router = express.Router();
const conn = require("../utils/db");

router.get("/:id", async (req, res, next) => {
  let result = await conn.query(
    `SELECT * FROM gallery WHERE i_id = ${req.params.id}`
  );
  res.json(result[0]);
});

module.exports = router;
