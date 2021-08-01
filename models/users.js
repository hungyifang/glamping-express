const conn = require("../utils/db");

const tableName = "users";
const idField = "u_id";

const _createWhereSql = (params, type = "AND") => {
  const where = [];
  let whereSql = "";

  for (const [key, value] of Object.entries(params)) {
    // if value is not undefined
    if (value) {
      where.push(`${key} = '${value}'`);
    }
  }

  if (where.length) whereSql = ` WHERE ` + where.join(` ${type} `);

  return whereSql;
};

// findById
module.exports.findById = async (userId) => {
  let sql = `SELECT * FROM ${tableName} WHERE ${idField} = ${userId}`;

  try {
    const [rows] = await conn.query(sql);
    return rows.length ? rows[0] : {};
  } catch (error) {
    console.log("db/model error occurred: ", error);
    return error;
  }
};

// use name, email, username to find just one record
module.exports.findOne = async (query) => {
  let sql = `SELECT * FROM ${tableName}`;

  // if has req.query
  const whereSql = _createWhereSql({
    // name: query.name,
    email: query.email,
    username: query.username,
    password: query.password,
  });

  console.log(sql + whereSql + ` LIMIT 0,1`);

  try {
    const [rows] = await conn.query(sql + whereSql + ` LIMIT 0,1`);
    console.log(rows);

    return rows[0] ? rows[0] : {};
  } catch (error) {
    console.log("db/model error occurred: ", error);
    return error;
  }
};

// Find one for login
module.exports.findOneForLogin = async (query) => {
  let sql = `SELECT * FROM ${tableName} WHERE password = '${query.password}' AND (username = '${query.username}' OR email = '${query.username}' OR tel = '${query.username}')`;

  try {
    const [rows] = await conn.query(sql + ` LIMIT 0,1`);
    console.log(rows);
    return rows[0] ? rows[0] : {};
  } catch (error) {
    console.log("db/model error occurred: ", error);
    return error;
  }
};
