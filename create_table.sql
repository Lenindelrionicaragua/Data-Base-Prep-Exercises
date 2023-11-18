-- Check if tables exist before creating them
CREATE TABLE IF NOT EXISTS Recipes (
    recipe_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100),
    instructions TEXT,
    baking_required BOOLEAN
);

CREATE TABLE IF NOT EXISTS Categories (
    category_id INT AUTO_INCREMENT PRIMARY KEY,
    category_name VARCHAR(50)
);

CREATE TABLE IF NOT EXISTS Ingredients (
    ingredient_id INT AUTO_INCREMENT PRIMARY KEY,
    ingredient_name VARCHAR(50)
);

CREATE TABLE IF NOT EXISTS RecipeIngredients (
    recipe_id INT,
    ingredient_id INT,
    quantity VARCHAR(20),
    PRIMARY KEY (recipe_id, ingredient_id),
    FOREIGN KEY (recipe_id) REFERENCES Recipes(recipe_id),
    FOREIGN KEY (ingredient_id) REFERENCES Ingredients(ingredient_id)
);

CREATE TABLE IF NOT EXISTS RecipeCategories (
    recipe_id INT,
    category_id INT,
    PRIMARY KEY (recipe_id, category_id),
    FOREIGN KEY (recipe_id) REFERENCES Recipes(recipe_id),
    FOREIGN KEY (category_id) REFERENCES Categories(category_id)
);

CREATE TABLE IF NOT EXISTS IngredientCategories (
    ingredient_id INT,
    category_id INT,
    PRIMARY KEY (ingredient_id, category_id),
    FOREIGN KEY (ingredient_id) REFERENCES Ingredients(ingredient_id),
    FOREIGN KEY (category_id) REFERENCES Categories(category_id)
);
