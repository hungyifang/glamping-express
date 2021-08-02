const express = require("express");
const router = express.Router();
const conn = require("../utils/db");

router.get("/:id", async (req, res, next) => {
    let orderedviewResult = await conn.query(`SELECT * FROM ordered WHERE o_id = ${req.params.id}`);
    res.json(orderedviewResult[0][0]);
  });

module.exports = router;