const { executeQuery, connection } = require("./database.js");

async function runQueries() {
  try {
    // Query 1: All vegetarian recipes with potatoes
    const query1 = `
    SELECT DISTINCT r.*
    FROM Recipes r
    JOIN RecipeIngredients ri ON r.recipe_id = ri.recipe_id
    JOIN Ingredients i ON ri.ingredient_id = i.ingredient_id
    JOIN IngredientCategories ic ON i.ingredient_id = ic.ingredient_id
    JOIN Categories c ON ic.category_id = c.category_id
    WHERE c.category_name = 'Vegetarian'
    AND i.ingredient_name = 'Potatoes'; 
    `;

    const result1 = await executeQuery(query1);
    console.log("Query 1 result:", result1);

    // Query 2: All cakes that do not need baking
    const query2 = `
    SELECT *
    FROM Recipes
    WHERE baking_required = FALSE
    AND recipe_id IN (
        SELECT recipe_id
        FROM RecipeIngredients
        WHERE ingredient_id IN (
            SELECT ingredient_id
            FROM IngredientCategories
            WHERE category_id = (
                SELECT category_id
                FROM Categories
                WHERE category_name = 'Cake'
            )
        )
    );
    `;

    const result2 = await executeQuery(query2);
    console.log("Query 2 result:", result2);

    // Query 3: All vegan and Japanese recipes
    const query3 = `
    SELECT DISTINCT r.*
    FROM Recipes r
    JOIN RecipeCategories rc ON r.recipe_id = rc.recipe_id
    JOIN Categories c ON rc.category_id = c.category_id
    WHERE c.category_name IN ('Vegan', 'Japanese');
    `;

    const result3 = await executeQuery(query3);
    console.log("Query 3 result:", result3);
  } catch (error) {
    console.error("Error executing queries:", error);
  } finally {
    // Close the database connection
    connection.end();
  }
}

// Run the function to test the connection
runQueries();
