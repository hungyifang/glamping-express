require("dotenv").config();

const mysql = require("mysql2");

// 建立資料庫連線
const connection = {
    host: process.env.DB_HOST,
    user: process.env.DB_USER,
    password: process.env.DB_PASSWORD,
    database: process.env.DB_NAME,
    // dateStrings: true,
    waitForConnections: true,
    connectionLimit: 10,
    queueLimit: 0,
};

conn = mysql.createPool(connection).promise();

module.exports = conn;
