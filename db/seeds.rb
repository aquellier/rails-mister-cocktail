# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require "json"
require "open-uri"

p 'Cleaning database...'
Ingredient.destroy_all

p 'Creating ingredients'

INGREDIENTS_URL = 'http://www.thecocktaildb.com/api/json/v1/1/list.php?i=list'
# Reading JSON file
ingredients_json = open(INGREDIENTS_URL).read

# Parsing to get a hash
ingredients_parsed = JSON.parse(ingredients_json)

# Getting an a rray of hashes of drinks
all_ingredients = ingredients_parsed['drinks']

# For each element, get only the name of the ingredient
all_ingredients.each do |ingredient|
  ingredient.each do |key, value|
    Ingredient.create(name: value)
  end
end

p 'Ingredients have been successfully created!'


p 'Creating cocktails'
Cocktail.create(name: "Whiskey Sour")
Cocktail.create(name: "Margarita")
Cocktail.create(name: "Moscow Mule")
p 'Cocktails have been successfully created!'

p 'Creating Doses information'
Dose.create(cocktail: Cocktail.find(1), ingredient: Ingredient.find(14), description: "3cl")
Dose.create(cocktail: Cocktail.find(1), ingredient: Ingredient.find(25), description: "10g")
Dose.create(cocktail: Cocktail.find(1), ingredient: Ingredient.find(47), description: "One full lime")
Dose.create(cocktail: Cocktail.find(1), ingredient: Ingredient.find(79), description: "One egg white")
