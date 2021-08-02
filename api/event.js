const express = require("express");
const { route } = require("../routes");
const router = express.Router();
const conn = require("../utils/db");

router.get("/section", async (req, res, next) => {
  let eventCategory = await conn.query(
    `SELECT * FROM category WHERE title LIKE '%活動%'`
  );
  res.json(eventCategory);
});

router.get("/card", async (req, res, next) => {
  let c_id = req.query.c_id;
  let events = await conn.query(
    `SELECT * FROM items JOIN items_cat ON items.i_id = items_cat.i_id WHERE items.able = 1 AND items_cat.c_id IN (${c_id}) ORDER BY updated DESC`
  );
  res.json(events);
});

router.get("/card/rank/hot", async (req, res, next) => {
  let c_id = req.query.c_id;
  let orderBy = req.query.orderBy;
  let rank = await conn.query(
    `SELECT * FROM items JOIN items_cat ON items.i_id = items_cat.i_id WHERE items.able = 1 AND items_cat.c_id IN (${c_id}) ORDER BY ${orderBy} DESC LIMIT 4`
  );
  res.json(rank);
});

router.get("/card/rank/new", async (req, res, next) => {
  let c_id = req.query.c_id;
  let orderBy = req.query.orderBy;
  let rank = await conn.query(
    `SELECT * FROM items JOIN items_cat ON items.i_id = items_cat.i_id WHERE items.able = 1 AND items_cat.c_id IN (${c_id}) ORDER BY ${orderBy} DESC LIMIT 4`
  );
  res.json(rank);
});

router.get("/card/userDeg", async (req, res, next) => {
  let u_id = req.query.u_id;
  let deg = await conn.query(`SELECT * FROM users_choice WHERE u_id = ${u_id}`);
  res.json(deg);
});

router.get("/card/review", async (req, res, next) => {
  let i_id = req.query.i_id;
  let reviews = await conn.query(
    `SELECT score FROM discuss WHERE i_id = ${i_id}`
  );
  res.json(reviews);
});

router.get("/fav", async (req, res, next) => {
  let fav = req.query.fav;
  let u_id = req.query.u_id;
  let i_id = req.query.i_id;
  let [rows, fields] = await conn.query(
    `INSERT INTO users_likes  (u_id,i_id,able) VALUES (${u_id},${i_id},${fav})`
  );
  res.json("success");
});

router.get("/checkFav", async (req, res, next) => {
  let u_id = req.query.u_id;
  let i_id = req.query.i_id;
  //確認使用者是否有加入紀錄
  let result = await conn.query(
    `SELECT * FROM users_likes WHERE u_id= ${u_id} AND i_id = ${i_id})`
  );
  //如果沒有加入資料庫 able=0
  if (result.length === 0) {
    let [rows, fields] = await conn.query(
      `INSERT INTO users_likes  (u_id,i_id,able) VALUES (${u_id},${i_id},0)`
    );
    return res.json("success");
  }
  res.json(result.data[0].able);
});

router.get("/detail", async (req, res, next) => {
  let i_id = req.query.i_id;
  let result = await conn.query(
    `SELECT * FROM items WHERE able = 1 AND i_id = ${i_id}`
  );
  res.json(result);
});

router.get("/review/name", async (req, res, next) => {
  let u_id = req.query.u_id;
  let result = await conn.query(
    `SELECT username FROM users WHERE u_id = ${u_id}`
  );
  res.json(result);
});

router.get("/review/withPage", async (req, res, next) => {
  let i_id = req.query.i_id;
  let limit = req.query.limit;
  let offset = req.query.offset;
  let reviews = await conn.query(
    `SELECT * FROM discuss WHERE i_id = ${i_id} limit ${limit} offset ${offset}`
  );
  res.json(reviews);
});

router.get("/review", async (req, res, next) => {
  let i_id = req.query.i_id;
  let reviews = await conn.query(`SELECT * FROM discuss WHERE i_id = ${i_id}`);
  res.json(reviews);
});

module.exports = router;
