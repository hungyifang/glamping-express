const express = require("express");
const router = express.Router();
const conn = require("../utils/db");

router.get("/", async (req, res, next) => {
    let result = await conn.query(`SELECT COUNT(id) as count, occupy FROM rooms WHERE stay = 1 GROUP BY occupy`);
    res.json(result[0]);
  });
router.get("/sea", async (req, res, next) => {
    let result = await conn.query(`SELECT COUNT(id) as count, occupy, level FROM rooms WHERE level = 36 AND stay = 1 GROUP BY occupy `);
    res.json(result[0]);
  });
router.get("/grass", async (req, res, next) => {
    let result = await conn.query(`SELECT COUNT(id) as count, occupy, level FROM rooms WHERE level = 37 AND stay = 1 GROUP BY occupy `);
    res.json(result[0]);
  });  
router.get("/top", async (req, res, next) => {
    let result = await conn.query(`SELECT COUNT(id) as count, occupy, level FROM rooms WHERE level = 38 AND stay = 1 GROUP BY occupy `);
    res.json(result[0]);
  });  
  router.post("/rooms", async (req, res, next) => {
    req.body.forEach(async(e) => {await conn.query(`INSERT INTO rooms (o_id, level, occupy) VALUES (?)`,[[e.o_id, e.level, e.occupy]]);});
    res.json({ msg: "編輯成功" });

  })

module.exports = router;