-- No-Bake Cheesecake
INSERT INTO Recipe (name, instructions)
VALUES ('No-Bake Cheesecake', 'Beat Cream Cheese; Add condensed Milk and blend; Add Lemon Juice and blend; Add the mix to the pie crust; Spread the Cherry Jam; Place in refrigerator for 3h.');

SET @recipe_id = LAST_INSERT_ID();

INSERT INTO RecipeDetails (recipe_id, baking_required, prep_time, difficulty_level, chef_notes)
VALUES (@recipe_id, FALSE, 20, 'Easy', 'Delicious no-bake cheesecake.');

INSERT INTO Categories (category_name) VALUES ('Cake');
INSERT INTO Categories (category_name) VALUES ('No-Bake');
INSERT INTO Categories (category_name) VALUES ('Vegetarian');

INSERT INTO RecipeCategories (recipe_id, category_id)
VALUES (@recipe_id, (SELECT category_id FROM Categories WHERE category_name = 'Cake' LIMIT 1)),
       (@recipe_id, (SELECT category_id FROM Categories WHERE category_name = 'No-Bake' LIMIT 1)),
       (@recipe_id, (SELECT category_id FROM Categories WHERE category_name = 'Vegetarian' LIMIT 1));

INSERT IGNORE INTO Ingredients (ingredient_name) VALUES
('Condensed milk'),
('Cream Cheese'),
('Lemon Juice'),
('Pie Crust'),
('Cherry Jam');

INSERT INTO IngredientDetails (ingredient_id, brand, expiration_date, nutritional_information)
VALUES
((SELECT ingredient_id FROM Ingredients WHERE ingredient_name = 'Condensed milk' LIMIT 1), 'AnyBrand', '2023-12-31', 'Sweetened condensed milk.'),
((SELECT ingredient_id FROM Ingredients WHERE ingredient_name = 'Cream Cheese' LIMIT 1), 'AnyBrand', '2023-12-31', 'Creamy cheese.'),
((SELECT ingredient_id FROM Ingredients WHERE ingredient_name = 'Lemon Juice' LIMIT 1), 'AnyBrand', '2023-12-31', 'Fresh lemon juice.'),
((SELECT ingredient_id FROM Ingredients WHERE ingredient_name = 'Pie Crust' LIMIT 1), 'AnyBrand', '2023-12-31', 'Pre-made pie crust.'),
((SELECT ingredient_id FROM Ingredients WHERE ingredient_name = 'Cherry Jam' LIMIT 1), 'AnyBrand', '2023-12-31', 'Sweet cherry jam.');

INSERT INTO IngredientQuantities (recipe_id, ingredient_id, quantity)
VALUES
(@recipe_id, (SELECT ingredient_id FROM Ingredients WHERE ingredient_name = 'Condensed milk' LIMIT 1), 'To taste'),
(@recipe_id, (SELECT ingredient_id FROM Ingredients WHERE ingredient_name = 'Cream Cheese' LIMIT 1), 'To taste'),
(@recipe_id, (SELECT ingredient_id FROM Ingredients WHERE ingredient_name = 'Lemon Juice' LIMIT 1), 'To taste'),
(@recipe_id, (SELECT ingredient_id FROM Ingredients WHERE ingredient_name = 'Pie Crust' LIMIT 1), 'To taste'),
(@recipe_id, (SELECT ingredient_id FROM Ingredients WHERE ingredient_name = 'Cherry Jam' LIMIT 1), 'To taste');

-- Roasted Brussels Sprouts
INSERT INTO Recipe (name, instructions)
VALUES ('Roasted Brussels Sprouts', 'Preheat the oven; Mix the ingredients in a bowl; Spread the mix on a baking sheet; Bake for 30 minutes.');

SET @recipe_id = LAST_INSERT_ID();

INSERT INTO RecipeDetails (recipe_id, baking_required, prep_time, difficulty_level, chef_notes)
VALUES (@recipe_id, TRUE, 15, 'Easy', 'Crispy roasted Brussels sprouts.');

INSERT IGNORE INTO Categories (category_name)
VALUES
('Vegan'),
('Gluten-Free');

INSERT INTO RecipeCategories (recipe_id, category_id)
VALUES (@recipe_id, (SELECT category_id FROM Categories WHERE category_name = 'Vegan' LIMIT 1)),
       (@recipe_id, (SELECT category_id FROM Categories WHERE category_name = 'Gluten-Free' LIMIT 1));

INSERT IGNORE INTO Ingredients (ingredient_name)
VALUES
('Brussels Sprouts'),
('Lemon juice'),
('Sesame seeds'),
('Pepper'),
('Salt'),
('Olive oil');

INSERT INTO IngredientDetails (ingredient_id, brand, expiration_date, nutritional_information)
VALUES
((SELECT ingredient_id FROM Ingredients WHERE ingredient_name = 'Brussels Sprouts' LIMIT 1), 'AnyBrand', '2023-12-31', 'Fresh Brussels sprouts.'),
((SELECT ingredient_id FROM Ingredients WHERE ingredient_name = 'Lemon juice' LIMIT 1), 'AnyBrand', '2023-12-31', 'Fresh lemon juice.'),
((SELECT ingredient_id FROM Ingredients WHERE ingredient_name = 'Sesame seeds' LIMIT 1), 'AnyBrand', '2023-12-31', 'Toasted sesame seeds.'),
((SELECT ingredient_id FROM Ingredients WHERE ingredient_name = 'Pepper' LIMIT 1), 'AnyBrand', '2023-12-31', 'Freshly ground pepper.'),
((SELECT ingredient_id FROM Ingredients WHERE ingredient_name = 'Salt' LIMIT 1), 'AnyBrand', '2023-12-31', 'Sea salt.'),
((SELECT ingredient_id FROM Ingredients WHERE ingredient_name = 'Olive oil' LIMIT 1), 'AnyBrand', '2023-12-31', 'Wonderful flavor.');

INSERT INTO IngredientQuantities (recipe_id, ingredient_id, quantity)
VALUES
(@recipe_id, (SELECT ingredient_id FROM Ingredients WHERE ingredient_name = 'Brussels Sprouts' LIMIT 1), 'To taste'),
(@recipe_id, (SELECT ingredient_id FROM Ingredients WHERE ingredient_name = 'Lemon juice' LIMIT 1), 'To taste'),
(@recipe_id, (SELECT ingredient_id FROM Ingredients WHERE ingredient_name = 'Sesame seeds' LIMIT 1), 'To taste'),
(@recipe_id, (SELECT ingredient_id FROM Ingredients WHERE ingredient_name = 'Pepper' LIMIT 1), 'To taste'),
(@recipe_id, (SELECT ingredient_id FROM Ingredients WHERE ingredient_name = 'Salt' LIMIT 1), 'To taste'),
(@recipe_id, (SELECT ingredient_id FROM Ingredients WHERE ingredient_name = 'Olive oil' LIMIT 1), 'To taste');

-- Mac & Cheese

INSERT INTO Recipe (name, instructions)
VALUES ('Mac & Cheese', 'Cook Macaroni for 8 minutes; Melt butter in a saucepan; Add flour, salt, pepper and mix; Add Milk and mix; Cook until mix is smooth; Add cheddar cheese; Add the macaroni.');

SET @recipe_id = LAST_INSERT_ID();

INSERT INTO RecipeDetails (recipe_id, baking_required, prep_time, difficulty_level, chef_notes)
VALUES (@recipe_id, TRUE, 30, 'Medium', 'Classic macaroni and cheese.');

INSERT IGNORE INTO Categories (category_name)
VALUES ('Vegetarian');

INSERT INTO RecipeCategories (recipe_id, category_id)
VALUES (@recipe_id, (SELECT category_id FROM Categories WHERE category_name = 'Vegetarian' LIMIT 1));

INSERT IGNORE INTO Ingredients (ingredient_name)
VALUES
('Macaroni'),
('Butter'),
('Flour'),
('Salt'),
('Pepper'),
('Milk'),
('Shredded Cheddar cheese');

INSERT INTO IngredientDetails (ingredient_id, brand, expiration_date, nutritional_information)
VALUES
((SELECT ingredient_id FROM Ingredients WHERE ingredient_name = 'Macaroni' LIMIT 1), 'AnyBrand', '2023-12-31', 'Durum wheat pasta.'),
((SELECT ingredient_id FROM Ingredients WHERE ingredient_name = 'Butter' LIMIT 1), 'AnyBrand', '2023-12-31', 'Unsalted butter.'),
((SELECT ingredient_id FROM Ingredients WHERE ingredient_name = 'Flour' LIMIT 1), 'AnyBrand', '2023-12-31', 'All-purpose flour.'),
((SELECT ingredient_id FROM Ingredients WHERE ingredient_name = 'Salt' LIMIT 1), 'AnyBrand', '2023-12-31', 'Sea salt.'),
((SELECT ingredient_id FROM Ingredients WHERE ingredient_name = 'Pepper' LIMIT 1), 'AnyBrand', '2023-12-31', 'Freshly ground pepper.'),
((SELECT ingredient_id FROM Ingredients WHERE ingredient_name = 'Milk' LIMIT 1), 'AnyBrand', '2023-12-31', 'Whole milk.'),
((SELECT ingredient_id FROM Ingredients WHERE ingredient_name = 'Shredded Cheddar cheese' LIMIT 1), 'AnyBrand', '2023-12-31', 'Sharp cheddar cheese.');

INSERT INTO IngredientQuantities (recipe_id, ingredient_id, quantity)
VALUES
(@recipe_id, (SELECT ingredient_id FROM Ingredients WHERE ingredient_name = 'Macaroni' LIMIT 1), 'To taste'),
(@recipe_id, (SELECT ingredient_id FROM Ingredients WHERE ingredient_name = 'Butter' LIMIT 1), 'To taste'),
(@recipe_id, (SELECT ingredient_id FROM Ingredients WHERE ingredient_name = 'Flour' LIMIT 1), 'To taste'),
(@recipe_id, (SELECT ingredient_id FROM Ingredients WHERE ingredient_name = 'Salt' LIMIT 1), 'To taste'),
(@recipe_id, (SELECT ingredient_id FROM Ingredients WHERE ingredient_name = 'Pepper' LIMIT 1), 'To taste'),
(@recipe_id, (SELECT ingredient_id FROM Ingredients WHERE ingredient_name = 'Milk' LIMIT 1), 'To taste'),
(@recipe_id, (SELECT ingredient_id FROM Ingredients WHERE ingredient_name = 'Shredded Cheddar cheese' LIMIT 1), 'To taste');

-- Tamagoyaki Japanese Omelette

INSERT INTO Recipe (name, instructions)
VALUES ('Tamagoyaki Japanese Omelette', 'Beat the eggs; Add soya sauce, sugar and salt; Add oil to a saucepan; Bring to medium heat; Add some mix to the saucepan; Let it cook for 1 minute; Add oil to a saucepan; Add some mix to the saucepan; Let it cook for 1 minute; Remove pan from fire.');

SET @recipe_id = LAST_INSERT_ID();

INSERT INTO RecipeDetails (recipe_id, baking_required, prep_time, difficulty_level, chef_notes)
VALUES (@recipe_id, FALSE, 15, 'Easy', 'Traditional Japanese omelette.');

INSERT IGNORE INTO Categories (category_name)
VALUES
('Vegetarian'),
('Japanese');

INSERT INTO RecipeCategories (recipe_id, category_id)
VALUES (@recipe_id, (SELECT category_id FROM Categories WHERE category_name = 'Vegetarian' LIMIT 1)),
       (@recipe_id, (SELECT category_id FROM Categories WHERE category_name = 'Japanese' LIMIT 1));

INSERT IGNORE INTO Ingredients (ingredient_name)
VALUES
('Eggs'),
('Soy sauce'),
('Sugar'),
('Salt'),
('Olive Oil');

INSERT INTO IngredientDetails (ingredient_id, brand, expiration_date, nutritional_information)
VALUES
((SELECT ingredient_id FROM Ingredients WHERE ingredient_name = 'Eggs' LIMIT 1), 'AnyBrand', '2023-12-31', 'Fresh eggs.'),
((SELECT ingredient_id FROM Ingredients WHERE ingredient_name = 'Soy sauce' LIMIT 1), 'AnyBrand', '2023-12-31', 'Japanese soy sauce.'),
((SELECT ingredient_id FROM Ingredients WHERE ingredient_name = 'Sugar' LIMIT 1), 'AnyBrand', '2023-12-31', 'White sugar.'),
((SELECT ingredient_id FROM Ingredients WHERE ingredient_name = 'Salt' LIMIT 1), 'AnyBrand', '2023-12-31', 'To taste'),
((SELECT ingredient_id FROM Ingredients WHERE ingredient_name = 'Olive Oil' LIMIT 1), 'AnyBrand', '2023-12-31', 'To taste');

INSERT INTO IngredientQuantities (recipe_id, ingredient_id, quantity)
VALUES
(@recipe_id, (SELECT ingredient_id FROM Ingredients WHERE ingredient_name = 'Eggs' LIMIT 1), 'To taste'),
(@recipe_id, (SELECT ingredient_id FROM Ingredients WHERE ingredient_name = 'Soy sauce' LIMIT 1), 'To taste'),
(@recipe_id, (SELECT ingredient_id FROM Ingredients WHERE ingredient_name = 'Sugar' LIMIT 1), 'To taste'),
(@recipe_id, (SELECT ingredient_id FROM Ingredients WHERE ingredient_name = 'Salt' LIMIT 1), 'To taste'),
(@recipe_id, (SELECT ingredient_id FROM Ingredients WHERE ingredient_name = 'Olive Oil' LIMIT 1), 'To taste');
