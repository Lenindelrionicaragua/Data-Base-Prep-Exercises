const fs = require("fs");
const { promisify } = require("util");
const readFileAsync = promisify(fs.readFile);

const { executeQuery, connection } = require("./database");

const insertRecipes = async () => {
  try {
    // Read the SQL queries from the file
    const queries = await readFileAsync("insert_recipes.sql", "utf8");

    // Split the file content into individual queries
    const individualQueries = queries.split(";");

    // Execute each query
    for (const query of individualQueries) {
      if (query.trim() !== "") {
        console.log(query);
        await executeQuery(query);
      }
    }

    console.log("Recipes inserted successfully.");
  } catch (error) {
    console.error("Error inserting recipes:", error);
  } finally {
    connection.end(); // Close the database connection
  }
};

// Run the function to insert recipes
insertRecipes();
