const express = require("express");
const { route } = require("../routes");
const router = express.Router();
const conn = require("../utils/db");

router.put("/edit/:id", async (req, res, next) => {
    await conn.query(`UPDATE users \
    SET username = '${req.query.username}', password = '${req.query.password}', email = '${req.query.email}', tel = '${req.query.tel}', visited = NOW() \
    WHERE u_id =  ${req.params.id}`);

    res.json({msg: "text"});
});

router.get("/:id", async (req, res, next) => {
    let result = await conn.query(
        `SELECT * FROM users WHERE u_id = ${req.params.id}`
    );
    console.log(result);
});

router.get("/", async (req, res, next) => {
    let result = await conn.query(`SELECT * FROM users`);
    console.log(result);
});

module.exports = router;
