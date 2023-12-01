const { MongoClient } = require("mongodb");
const { setupDatabase, closeDatabase } = require("./databaseSetup");

require("dotenv").config();

const url = process.env.MONGODB_URL;
const dbName = process.env.MONGODB_DB_NAME;

const recipes1 = [
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
    ingredientsQuantities: [
      { name: "Condensed milk", quantity: "To taste" },
      { name: "Cream Cheese", quantity: "To taste" },
      { name: "Lemon Juice", quantity: "To taste" },
      { name: "Pie Crust", quantity: "To taste" },
      { name: "Cherry Jam", quantity: "To taste" },
    ],
  },
];

const recipes2 = [
  {
    name: "Roasted Brussels Sprout",
    instructions:
      "Preheat the oven; Mix the ingredients in a bowl; Spread the mix on a baking sheet; Bake for 30 minutes.",
    details: {
      baking_required: true,
      prep_time: 15,
      difficulty_level: "Easy",
      chef_notes: "Crispy roasted Brussels sprouts.",
    },
    categories: ["Vegan", "Gluten-Free"],
    ingredientsQuantities: [
      { name: "Brussels Sprouts", quantity: "To taste" },
      { name: "Lemon juice", quantity: "To taste" },
      { name: "Sesame seeds", quantity: "To taste" },
      { name: "Pepper", quantity: "To taste" },
      { name: "Salt", quantity: "To taste" },
      { name: "Olive oil", quantity: "To taste" },
    ],
  },
];

const ingredients = [
  {
    name: "Condensed milk",
    details: {
      brand: "AnyBrand",
      expiration_date: new Date("2023-12-31"),
      nutritional_information: "Sweetened condensed milk.",
    },
  },
  {
    name: "Cream Cheese",
    details: {
      brand: "AnyBrand",
      expiration_date: new Date("2023-12-31"),
      nutritional_information: "Creamy cheese.",
    },
  },
  {
    name: "Lemon Juice",
    details: {
      brand: "AnyBrand",
      expiration_date: new Date("2023-12-31"),
      nutritional_information: "Fresh lemon juice.",
    },
  },
];

async function insertData(db, collectionName, data) {
  for (const item of data) {
    const collection = db.collection(collectionName);
    const existingItem = await collection.findOne({ name: item.name });

    if (!existingItem) {
      const result = await collection.insertOne(item);
      console.log(`Inserted ${item.name} into ${collectionName} collection`);
    } else {
      console.log(
        `${item.name} already exists in ${collectionName} collection`
      );
    }
  }
}

async function InsertData() {
  const client = await setupDatabase();

  try {
    const db = client.db(dbName);

    await insertData(db, "recipes", recipes1);
    await insertData(db, "recipes", recipes2);
    await insertData(db, "ingredients", ingredients);
  } finally {
    await closeDatabase(client);
    console.log("Connection closed");
  }
}

InsertData();
