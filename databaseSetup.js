const { MongoClient, ServerApiVersion } = require("mongodb");
require("dotenv").config();

const databaseUrl =
  process.env.MONGODB_URL || "mongodb://localhost:27017/recipes_db";

async function setupDatabase() {
  if (process.env.MONGODB_URL == null) {
    throw new Error(
      "Error: The MONGODB_URL environment variable is not set. Please create a '.env' file and add the variable."
    );
  }

  const client = new MongoClient(process.env.MONGODB_URL, {
    useNewUrlParser: true,
    useUnifiedTopology: true,
    serverApi: ServerApiVersion.v1,
  });

  try {
    await client.connect();
    console.log("Connected to the database");
    return client;
  } catch (err) {
    console.error("Error connecting to the database:", err.message);
    throw new Error(
      "Unable to connect to the database. Please check your connection settings and try again."
    );
  }
}

async function closeDatabase(client) {
  try {
    await client.close();
    console.log("Connection closed");
  } catch (err) {
    console.error("Error closing the database connection:", err.message);
    throw new Error(
      "Unable to close the database connection. Please check your connection and try again."
    );
  }
}

module.exports = {
  setupDatabase,
  closeDatabase,
};
