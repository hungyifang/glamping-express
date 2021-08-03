const express = require("express");
const router = express.Router();
const conn = require("../utils/db");

router.get("/", async (req, res, next) => {
  let result = await conn.query(
    `SELECT * FROM items, items_cat, trips WHERE items.i_id = items_cat.i_id AND items_cat.i_id = trips.as_a_item`
  );
  res.json(result[0]);
});

router.get("/item", async (req, res, next) => {
  let result = await conn.query(
    `SELECT items.title, items.price, items.i_id, items.article FROM items`
  );
  res.json(result[0]);
});

// `SELECT * FROM items, items_cat, trips WHERE items.i_id = items_cat.i_id AND items_cat.i_id = trips.as_a_item`

module.exports = router;
