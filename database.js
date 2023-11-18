const mysql = require("mysql");
const util = require("util");

const connection = mysql.createConnection({
  host: "localhost",
  user: "hyfuser",
  password: "1111",
  database: "recipes_table",
});

// Promisify the connection.query method
const query = util.promisify(connection.query).bind(connection);

connection.connect((err) => {
  if (err) {
    console.error("Error connecting to MySQL:", err);
  } else {
    console.log("Connected to MySQL!");
  }
});

const executeQuery = (queryString) => {
  return query(queryString);
};

module.exports = {
  executeQuery,
  connection,
};
