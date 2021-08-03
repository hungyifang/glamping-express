const express = require("express");
const router = express.Router();
const conn = require("../utils/db");

router.get("/", async (req, res, next) => {
    let result = await conn.query(`SELECT * FROM ordered_detail, items WHERE ordered_detail.i_id = items.i_id`);
    res.json(result[0]);
  });


  
  module.exports = router;