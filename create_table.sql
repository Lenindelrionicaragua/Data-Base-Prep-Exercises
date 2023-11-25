-- Create Recipe table
CREATE TABLE IF NOT EXISTS Recipe (
    recipe_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100),
    instructions TEXT
);

-- Create RecipeDetails table
CREATE TABLE IF NOT EXISTS RecipeDetails (
    recipe_details_id INT AUTO_INCREMENT PRIMARY KEY,
    recipe_id INT UNIQUE,
    baking_required BOOLEAN,
    prep_time INT,
    difficulty_level VARCHAR(20),
    chef_notes TEXT,
    FOREIGN KEY (recipe_id) REFERENCES Recipe(recipe_id)
);

-- Create Categories table
CREATE TABLE IF NOT EXISTS Categories (
    category_id INT AUTO_INCREMENT PRIMARY KEY,
    category_name VARCHAR(50)
);

-- Create RecipeCategories table
CREATE TABLE IF NOT EXISTS RecipeCategories (
    recipe_id INT,
    category_id INT,
    PRIMARY KEY (recipe_id, category_id),
    FOREIGN KEY (recipe_id) REFERENCES RecipeDetails(recipe_id),
    FOREIGN KEY (category_id) REFERENCES Categories(category_id)
);

-- Create Ingredients table
CREATE TABLE IF NOT EXISTS Ingredients (
    ingredient_id INT AUTO_INCREMENT PRIMARY KEY,
    category_id INT, 
    ingredient_name VARCHAR(50),
    FOREIGN KEY (category_id) REFERENCES Categories(category_id)
);

-- Create IngredientDetails table
CREATE TABLE IF NOT EXISTS IngredientDetails (
    ingredient_details_id INT AUTO_INCREMENT PRIMARY KEY,
    ingredient_id INT UNIQUE,
    brand VARCHAR(50),
    expiration_date DATE,
    nutritional_information TEXT,
    FOREIGN KEY (ingredient_id) REFERENCES Ingredients(ingredient_id)
);

-- Create IngredientQuantities table
CREATE TABLE IF NOT EXISTS IngredientQuantities (
    recipe_id INT,
    ingredient_id INT,
    quantity VARCHAR(20),
    PRIMARY KEY (recipe_id, ingredient_id),
    FOREIGN KEY (recipe_id) REFERENCES RecipeDetails(recipe_id),
    FOREIGN KEY (ingredient_id) REFERENCES IngredientDetails(ingredient_id)
);

