-- Insert Vegetable Curry with Potatoes recipe
INSERT INTO Recipes (name, instructions, baking_required)
VALUES ('Vegetable Curry with Potatoes', 'Boil the potatoes; Cook vegetables in a pan; Add curry sauce and potatoes; Simmer until cooked through.', FALSE);

-- Get the last inserted recipe ID
SET @recipe_id = LAST_INSERT_ID();

-- Insert categories for Vegetable Curry with Potatoes
INSERT INTO RecipeCategories (recipe_id, category_id)
VALUES
(@recipe_id, (SELECT category_id FROM Categories WHERE category_name = 'Vegetarian' LIMIT 1));

-- Insert ingredients for Vegetable Curry with Potatoes
INSERT INTO RecipeIngredients (recipe_id, ingredient_id, quantity)
VALUES
(@recipe_id, (SELECT ingredient_id FROM Ingredients WHERE ingredient_name = 'Potatoes' LIMIT 1), 'To taste'),
(@recipe_id, (SELECT ingredient_id FROM Ingredients WHERE ingredient_name = 'Mixed Vegetables' LIMIT 1), 'To taste'),
(@recipe_id, (SELECT ingredient_id FROM Ingredients WHERE ingredient_name = 'Curry Sauce' LIMIT 1), 'To taste');

-- Insert No-Bake Chocolate Cake recipe
INSERT INTO Recipes (name, instructions, baking_required)
VALUES ('No-Bake Chocolate Cake', 'Mix crushed cookies, melted butter, and cocoa powder; Press mixture into a cake pan; Refrigerate until set.', FALSE);

-- Get the last inserted recipe ID
SET @recipe_id = LAST_INSERT_ID();

-- Insert categories for No-Bake Chocolate Cake
INSERT INTO RecipeCategories (recipe_id, category_id)
VALUES
(@recipe_id, (SELECT category_id FROM Categories WHERE category_name = 'Cake' LIMIT 1));

-- Insert ingredients for No-Bake Chocolate Cake
INSERT INTO RecipeIngredients (recipe_id, ingredient_id, quantity)
VALUES
(@recipe_id, (SELECT ingredient_id FROM Ingredients WHERE ingredient_name = 'Chocolate Cookies' LIMIT 1), 'To taste'),
(@recipe_id, (SELECT ingredient_id FROM Ingredients WHERE ingredient_name = 'Butter' LIMIT 1), 'To taste'),
(@recipe_id, (SELECT ingredient_id FROM Ingredients WHERE ingredient_name = 'Cocoa Powder' LIMIT 1), 'To taste');
