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
  let deg = await conn.query(
    `SELECT deg_1, deg_2, deg_3 FROM users WHERE u_id = ${u_id}`
  );
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
    `UPDATE users_likes SET able = ${fav} WHERE u_id = ${u_id} AND i_id = ${i_id}`
  );
  res.json("success");
});

router.get("/checkFav", async (req, res, next) => {
  let u_id = req.query.u_id;
  let i_id = req.query.i_id;
  //確認使用者是否有加入紀錄
  let result = await conn.query(
    `SELECT * FROM users_likes WHERE u_id = ${u_id} AND i_id = ${i_id}`
  );
  // console.log(result[0][0].able);
  //如果沒有,加入資料庫 able=0
  if (result[0].length === 0) {
    let [rows, fields] = await conn.query(
      `INSERT INTO users_likes  (u_id,i_id,able) VALUES (${u_id},${i_id},0)`
    );
    return res.json("0");
  }
  res.json(result[0][0].able);
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

router.post("/addCart", async (req, res, next) => {
  let data = req.body.data;
  if (data.person === 0) {
    return res.json({ o_id: 0 });
  }
  if (data.u_id === "") {
    let insertDB = await conn.query(
      `INSERT INTO ordered (i_id, total, level, person, start, s_id, prime, title, message) VALUES (${data.i_id}, ${data.total}, ${data.level}, ${data.person}, '${data.start}', ${data.s_id}, ${data.prime}, '${data.title}', '${data.message}')`
    );
    let get_o_id = await conn.query(
      `SELECT o_id FROM ordered ORDER BY o_id DESC LIMIT 1`
    );
    let o_id = get_o_id[0][0].o_id;
    console.log(o_id);
    let reqData = { o_id: o_id };
    res.json(reqData);
  } else {
    let insertDB = await conn.query(
      `INSERT INTO ordered (u_id, i_id, total, level, person, start, s_id, prime, title, message) VALUES (${data.u_id}, ${data.i_id}, ${data.total}, ${data.level}, ${data.person}, '${data.start}', ${data.s_id}, ${data.prime}, '${data.title}', '${data.message}')`
    );
    let get_o_id = await conn.query(
      `SELECT o_id FROM ordered ORDER BY o_id DESC LIMIT 1`
    );
    let o_id = get_o_id[0][0].o_id;
    let reqData = { o_id: o_id };
    res.json(reqData);
  }
});

router.post("/order-detail", async (req, res, next) => {
  let data = req.body.data;
  let insertDB = await conn.query(
    `INSERT INTO ordered_detail (o_id, i_id, price, quantity, ship_date) VALUES (${data.o_id}, ${data.i_id}, ${data.price}, ${data.quantity}, '${data.ship_date}')`
  );
  res.json("success");
});

module.exports = router;
