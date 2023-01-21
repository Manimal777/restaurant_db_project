CREATE TABLE restaurants (
    id SERIAL,
    name TEXT NOT NULL UNIQUE,
    cuisine_type TEXT,
    owner TEXT,
    PRIMARY KEY (id)
);

CREATE TABLE food_items (
    id SERIAL,
    name TEXT NOT NULL UNIQUE,
    type TEXT,
    price FLOAT NOT NULL,
    PRIMARY KEY (id)

);

CREATE TABLE menus (
    id SERIAL,
    restaurant_id INT NOT NULL,
    name TEXT NOT NULL,
    time_of_day TEXT,
    restaurant_name TEXT NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE ingredients (
    id SERIAL,
    name TEXT NOT NULL UNIQUE,
    PRIMARY KEY (id)
);

CREATE TABLE food_items_ingredients (
    food_item_id INT NOT NULL,
    ingredient_id INT NOT NULL,
    PRIMARY KEY (food_item_id, ingredient_id)
);   

CREATE TABLE food_items_menus (
    food_item_id INT NOT NULL,
    menu_id INT NOT NULL, 
    PRIMARY KEY (food_item_id, menu_id)
);

ALTER TABLE food_items_ingredients
ADD CONSTRAINT fk_food_items_ingredients_food_item
FOREIGN KEY (food_item_id)
REFERENCES food_items(id);

ALTER TABLE food_items_ingredients
ADD CONSTRAINT fk_food_items_ingredients_ingredients
FOREIGN KEY (ingredient_id)
REFERENCES ingredients(id);

ALTER TABLE food_items_menus
ADD CONSTRAINT fk_food_items_menus_food_items
FOREIGN KEY (food_item_id)
REFERENCES food_items(id);

ALTER TABLE food_items_menus
ADD CONSTRAINT fk_food_items_menus_menus
FOREIGN KEY (menu_id)
REFERENCES menus(id);

ALTER TABLE menus
ADD CONSTRAINT fk_menus_restaurants
FOREIGN KEY (restaurant_id)
REFERENCES restaurants(id);