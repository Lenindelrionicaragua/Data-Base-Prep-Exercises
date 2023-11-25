const fs = require("fs");
const mysql = require("mysql2/promise");
const sqlParser = require("sql-parser");

const { connection } = require("./database");

const runQueriesFromFile = async (filePath) => {
  try {
    // Read the SQL queries from the file
    const content = fs.readFileSync(filePath, "utf8");

    // Parse the SQL queries
    const queries = sqlParser.parse(content);

    // Connect to the database
    const conn = await mysql.createConnection(connection.config);

    // Execute each query
    for (const query of queries) {
      const queryString = query.toString();
      if (queryString.trim() !== "") {
        console.log(queryString);
        await conn.query(queryString);
      }
    }

    console.log("Queries executed successfully.");
  } catch (error) {
    console.error("Error executing queries:", error);
  } finally {
    // Close the database connection
    connection.end();
  }
};

// Ruta completa de tu archivo SQL
const filePath =
  "/Users/leninortizreyes/Desktop/Data-Base-Prep-Exercises/Insert_recipes.sql";

// Run the function to execute queries from the file
runQueriesFromFile(filePath);
