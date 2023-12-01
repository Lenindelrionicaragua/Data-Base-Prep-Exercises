const { MongoClient } = require("mongodb");
const { createCollections } = require("./createCollections");
const { setupDatabase } = require("./databaseSetup");

const url = "mongodb://localhost:27017/recipes_db";

const dbName = "recipes_db";
setupDatabase(url, dbName);

const data = {
  Recipe: [
    {
      name: "No-Bake Cheesecake",
      instructions:
        "Beat Cream Cheese; Add condensed Milk and blend; Add Lemon Juice and blend; Add the mix to the pie crust; Spread the Cherry Jam; Place in refrigerator for 3h.",
      details: {
        baking_required: false,
        prep_time: 20,
        difficulty_level: "Easy",
        chef_notes: "Delicious no-bake cheesecake.",
      },
      categories: ["Cake", "No-Bake", "Vegetarian"],
    },
  ],
  Ingredients: [
    { name: "Condensed milk" },
    { name: "Cream Cheese" },
    { name: "Lemon Juice" },
    { name: "Pie Crust" },
    { name: "Cherry Jam" },
  ],
  IngredientDetails: [
    {
      ingredient_name: "Condensed milk",
      brand: "AnyBrand",
      expiration_date: new Date("2023-12-31"),
      nutritional_information: "Sweetened condensed milk.",
    },
    {
      ingredient_name: "Cream Cheese",
      brand: "AnyBrand",
      expiration_date: new Date("2023-12-31"),
      nutritional_information: "Creamy cheese.",
    },
    {
      ingredient_name: "Lemon Juice",
      brand: "AnyBrand",
      expiration_date: new Date("2023-12-31"),
      nutritional_information: "Fresh lemon juice.",
    },
    {
      ingredient_name: "Pie Crust",
      brand: "AnyBrand",
      expiration_date: new Date("2023-12-31"),
      nutritional_information: "Pre-made pie crust.",
    },
    {
      ingredient_name: "Cherry Jam",
      brand: "AnyBrand",
      expiration_date: new Date("2023-12-31"),
      nutritional_information: "Sweet cherry jam.",
    },
  ],
  IngredientQuantities: [
    {
      recipe_name: "No-Bake Cheesecake",
      ingredient_name: "Condensed milk",
      quantity: "To taste",
    },
    {
      recipe_name: "No-Bake Cheesecake",
      ingredient_name: "Cream Cheese",
      quantity: "To taste",
    },
    {
      recipe_name: "No-Bake Cheesecake",
      ingredient_name: "Lemon Juice",
      quantity: "To taste",
    },
    {
      recipe_name: "No-Bake Cheesecake",
      ingredient_name: "Pie Crust",
      quantity: "To taste",
    },
    {
      recipe_name: "No-Bake Cheesecake",
      ingredient_name: "Cherry Jam",
      quantity: "To taste",
    },
  ],
};

async function insertDocuments(db, collectionName, documents) {
  const result = await db.collection(collectionName).insertMany(documents);
  console.log(
    `Inserted ${result.insertedCount} documents into ${collectionName} collection`
  );
}

async function createDatabaseAndInsertData() {
  const client = new MongoClient(url, {
    useNewUrlParser: true,
    useUnifiedTopology: true,
  });

  try {
    await client.connect();
    console.log("Connected to the database");

    const db = client.db(dbName);

    // Create collections
    await createCollections();

    // Insert data into each collection
    for (const collectionName in data) {
      const documents = data[collectionName];
      await insertDocuments(db, collectionName, documents);
    }
  } finally {
    await client.close();
    console.log("Connection closed");
  }
}

createDatabaseAndInsertData();
