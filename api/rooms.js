const express = require("express");
const router = express.Router();
const conn = require("../utils/db");

router.get("/", async (req, res, next) => {
    let result = await conn.query(`SELECT COUNT(id) as count, occupy FROM rooms WHERE stay = 1 GROUP BY occupy`);
    res.json(result[0]);
  });
router.get("/sea", async (req, res, next) => {
    let result = await conn.query(`SELECT COUNT(id) as count, occupy, level FROM rooms WHERE level = 56 AND stay = 1 GROUP BY occupy `);
    res.json(result[0]);
  });
router.get("/grass", async (req, res, next) => {
    let result = await conn.query(`SELECT COUNT(id) as count, occupy, level FROM rooms WHERE level = 57 AND stay = 1 GROUP BY occupy `);
    res.json(result[0]);
  });  
router.get("/top", async (req, res, next) => {
    let result = await conn.query(`SELECT COUNT(id) as count, occupy, level FROM rooms WHERE level = 58 AND stay = 1 GROUP BY occupy `);
    res.json(result[0]);
  });  
  router.post("/rooms", async (req, res, next) => {
    req.body.forEach(async(e) => {await conn.query(`INSERT INTO rooms (o_id, level, occupy) VALUES (?)`,[[e.o_id, e.level, e.occupy]]);});
    res.json({ msg: "編輯成功" });

  });
  router.put("/established", async (req, res, next) => {
    for (let i = 0; i < req.body.length; i++){
      await conn.query(
        `UPDATE rooms SET stay = "1" WHERE o_id = ${req.body[i].o_id}`
      );
    }
    
    res.json({ msg: "訂單已成立" });
  });
  router.put("/orders/established", async (req, res, next) => {
    // console.log(req.body)
    for (let i = 0; i < req.body.length; i++){
      await conn.query(
        `UPDATE ordered SET s_id = "10" , u_id = ${req.body[i].u_id} WHERE o_id = ${req.body[i].o_id}`
      );
    }
    
    res.json({ msg: "訂單已成立" });
  });
module.exports = router;