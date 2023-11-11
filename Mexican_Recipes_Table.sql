CREATE TABLE Recipes (
    recipe_id INT PRIMARY KEY,
    name VARCHAR(100),
    instructions TEXT
);

CREATE TABLE Categories (
    category_id INT PRIMARY KEY,
    category_name VARCHAR(50)
);

CREATE TABLE Ingredients (
    ingredient_id INT PRIMARY KEY,
    ingredient_name VARCHAR(50)
);

CREATE TABLE RecipeIngredients (
    recipe_id INT,
    ingredient_id INT,
    quantity VARCHAR(20),
    PRIMARY KEY (recipe_id, ingredient_id),
    FOREIGN KEY (recipe_id) REFERENCES Recipes(recipe_id),
    FOREIGN KEY (ingredient_id) REFERENCES Ingredients(ingredient_id)
);
