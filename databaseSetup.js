const { MongoClient } = require("mongodb");
require("dotenv").config();

const url = process.env.MONGODB_URL;
const dbName = "recipes_db";

async function setupDatabase() {
  const client = new MongoClient(url, {
    useNewUrlParser: true,
    useUnifiedTopology: true,
  });

  try {
    await client.connect();
    console.log("Connected to the database");

    const db = client.db(dbName);

    // Check if the connection is successful
    const adminDb = client.db("admin");
    const pingResult = await adminDb.command({ ping: 1 });
    console.log("Ping result:", pingResult);
  } catch (error) {
    console.error("Error connecting to the database:", error.message);
  } finally {
    await client.close();
    console.log("Connection closed");
  }
}

module.exports = { setupDatabase };
