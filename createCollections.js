const { MongoClient } = require("mongodb");
const { setupDatabase } = require("./databaseSetup");

const url = "mongodb://localhost:27017";
const dbName = "recipes_db";
setupDatabase(url, dbName);

const data = {
  Recipe: {},
  RecipeDetails: {},
  Categories: {},
};

async function createCollections() {
  const client = new MongoClient(url, {
    useNewUrlParser: true,
    useUnifiedTopology: true,
  });

  try {
    await client.connect();
    console.log("Connected to the database");

    const db = client.db(dbName);

    for (const collectionName in data) {
      await createCollectionIfNotExists(db, collectionName);
    }
  } finally {
    await client.close();
    console.log("Connection closed");
  }
}

async function createCollectionIfNotExists(db, collectionName) {
  const collections = await db
    .listCollections({ name: collectionName })
    .toArray();
  if (collections.length === 0) {
    await db.createCollection(collectionName);
    console.log(`Created ${collectionName} collection`);
  } else {
    console.log(`${collectionName} collection already exists`);
  }
}

module.exports = { createCollections };
