My Portfolio Project: A Mall Food Court Concept

Description: A collection of tables that describes a traditional American Mall Food Court.
A table full of restaurant names with additional info about that restaurant. Each restaurant has a list of different menus it provides.
Each menu has a list of food items that it provides, with each item having addicional info. Each food item having many ingredients attached to it.

API Reference table:

File: restaurants.py (not all endpoints completed at this point)

    index: GET http://localhost:5000/restaurants
    parameters: none
    description: Returns a json list of all restaurants and their id's in the restaurants SQL table.

    show: GET http://localhost:5000/restuarants/<id:int>
    parameters: id
    description: Returns a specific restuarant listing in json with the given restuarant_id

    create: POST http://localhost:5000/restaurants
    parameters: name
    description: Creates a new restaurant in the restaurants table, and returns that restaurants id and name as a json

    update: PUT/PATCH http://localhost:5000/restaurants/<id:int>
    parameters: restaurant_id, name
    description: Updates the name of a restaurant given the restaurant_id parameter

    delete: DELETE http://localhost:5000/restaurants/<id:int>
    parameters: restaurant_id
    description: Deletes the restaurant id from the restaurants table, and returns the deleted id and name.

File: menus.py (not all endpoints completed at this time)

    index: GET http://localhost:5000/menus
    parameters: none
    description: Returns a json list of all menus in the entire food court.

    show: GET http://localhost:5000/menus/<id:int>
    parameters: menu_id
    description: Returns a specific menu listing in json with the given menu_id

    create: POST http://localhost:5000/menus
    parameters: name, restuarant_id
    description: Adds a new menu for a restuarant, given that the restaurant_id is valid, and returns the new menu id and name as a json.
    
    update: PATCH/PUT http://localhost:5000/menus/<id:int>
    parameters: menu_id, name, restaurant_id
    description: 

    delete: DELETE http://localhost:5000/menus/<id:int>
    parameters: menu_id
    description: Deletes the menu with given menu_id from the menus table.

File: food_items.py (not all endpoints completed at this time)

    index: GET http://localhost:5000/food_items
    parameters: none
    description: Returns a json list of all food_items in the food_items table

    show: GET http://localhost:5000/food_items/<id:int>
    paramaters: food_items_id
    description: Returns a single item in json of the food_item with given id

    create: POST http://localhost:5000/food_items
    parameters: name, menu_id, price
    description: Creates a new menu item, given a price, name, and a menu_id to assign it too.

    update: PUT/PATCH http://localhost:5000/food_items/<id:int>
    parameters:menu_id, OPTIONAL: name, price
    description: Updates a food items price, name, or both.

    delete: DELETE http://localhost:5000/food_items/<id:int>
    parameters: menu_id
    description: Deletes a menu item from the food_items database.

Additional Questions:
How did the project's design evolve over time?
My original design had separate branches of entities, but later on, it made more sense to
have a basic tree structure for each restaurant. 
Did you choose to use an ORM or raw SQL? Why?
I chose to use raw SQL, mainly because I have not had much practice with ORMs, and don't feel
comfortable using them. ALthough, with how the project could be improved, raw SQL would make more sense,
as for example if each restaurant had it's own menus, and I wanted to query all menus, I'd probably need
an advance SQL query with many joins and unions. Using an ORM for that would be difficult I assume.
What future improvements are in store, if any?
It would be to change the structure of the database to a tree structure, with each restaurant having its own menus, 
and each menu having its own food items. That would be more simple in my opinion, as well as having the url
addresses be more straightforward as well.