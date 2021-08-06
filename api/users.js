const express = require("express");
const router = express.Router();
const conn = require("../utils/db");

router.put("/:id", async (req, res, next) => {
  await conn.query(`UPDATE users \
    SET first_name = '${req.body.first_name}', last_name = '${req.body.last_name}', gender = '${req.body.gender}', birthday = '${req.body.birthday}', email = '${req.body.email}', tel = '${req.body.tel}', visited = NOW() \
    WHERE u_id =  ${req.params.id}`);
  res.json({ msg: "編輯成功" });
});

router.get("/:id", async (req, res, next) => {
  let result = await conn.query(
    `SELECT * FROM users WHERE u_id = ${req.params.id}`
  );
  res.json(result[0][0]);
});

router.get("/", async (req, res, next) => {
  let result = await conn.query(`SELECT * FROM users`);
  res.json(result[0]);
});

// router.post("/:id", async (req, res, next) => {
//   await conn.query(
//     `INSERT INTO gallery (u_id, src) VALUES ('${req.body.u_id}', '${req.body.src}'`
//   );
//   res.json({ msg: "1" });
// });

// router.post('/upload-image', userController.uploadImage)

router.post("/choices/:id", async (req, res, next) => {
  console.log(req.body.choices)
  await conn.query(`UPDATE users \
    SET deg_1 = '${req.body.choices[0]}', deg_2 = '${req.body.choices[1]}', deg_3 = '${req.body.choices[2]}', visited = NOW() \
    WHERE u_id =  ${req.params.id}`);
  res.json({ msg: "小測驗分數更新成功" });
});

module.exports = router;
