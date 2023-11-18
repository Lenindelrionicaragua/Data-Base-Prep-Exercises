-- Insert initial categories
INSERT IGNORE INTO Categories (category_name) VALUES ('Vegan'), ('Gluten-Free'), ('Vegetarian'), ('Japanese');

-- Insert initial ingredients
INSERT IGNORE INTO Ingredients (ingredient_name) VALUES 
    ('Brussels Sprouts'), ('Lemon Juice'), ('Sesame Seeds'), ('Pepper'), ('Salt'), ('Olive Oil'),
    ('Macaroni'), ('Butter'), ('Flour'), ('Salt'), ('Pepper'), ('Milk'), ('Shredded Cheddar Cheese'),
    ('Eggs'), ('Soy Sauce'), ('Sugar');

-- Insert new recipe
INSERT INTO Recipes (name, instructions, baking_required)
VALUES ('New Recipe', 'Instructions for the new recipe', TRUE);

-- Insert ingredients for the new recipe
SET @recipe_id = LAST_INSERT_ID();

INSERT INTO RecipeIngredients (recipe_id, ingredient_id, quantity)
VALUES
(@recipe_id, (SELECT ingredient_id FROM Ingredients WHERE ingredient_name = 'Condensed Milk' LIMIT 1), 'To taste'),
(@recipe_id, (SELECT ingredient_id FROM Ingredients WHERE ingredient_name = 'Cream Cheese' LIMIT 1), 'To taste');
