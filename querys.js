const { executeQuery, connection } = require("./database.js");

async function runQueries() {
  try {
    // Query 1: All vegetarian recipes with potatoes
    const query1 = `
      SELECT DISTINCT r.*
      FROM Recipe r
      JOIN RecipeDetails rd ON r.recipe_id = rd.recipe_id
      JOIN IngredientQuantities iq ON rd.recipe_details_id = iq.recipe_id
      JOIN IngredientDetails id ON iq.ingredient_id = id.ingredient_id
      JOIN Ingredients i ON id.ingredient_id = i.ingredient_id
      JOIN Categories c ON i.category_id = c.category_id
      WHERE c.category_name = 'Vegetarian'
      AND i.ingredient_name = 'Potatoes';
    `;

    const result1 = await executeQuery(query1);
    console.log("Query 1 result:", result1);

    // Query 2: All cakes that do not need baking
    const query2 = `
      SELECT DISTINCT r.*
      FROM Recipe r
      JOIN RecipeDetails rd ON r.recipe_id = rd.recipe_id
      JOIN RecipeCategories rc ON rd.recipe_details_id = rc.recipe_id
      LEFT JOIN IngredientQuantities iq ON rd.recipe_details_id = iq.recipe_id
      LEFT JOIN IngredientDetails id ON iq.ingredient_id = id.ingredient_id
      LEFT JOIN Ingredients i ON id.ingredient_id = i.ingredient_id
      LEFT JOIN Categories c ON rc.category_id = c.category_id
      WHERE rd.baking_required = FALSE
      AND c.category_name = 'Cake';
    `;

    const result2 = await executeQuery(query2);
    console.log("Query 2 result:", result2);

    // Query 3: All vegan and Japanese recipes
    const query3 = `
      SELECT DISTINCT r.*
      FROM Recipe r
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
