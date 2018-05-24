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

INGREDIENTS_URL = 'http://www.thecocktaildb.com/api/json/v1/1/list.php?i=list'
ingredients_json = open(INGREDIENTS_URL).read
# .read extract the json file & accesses the ingredients_json
ingredients_parsed = JSON.parse(ingredients_json)
# .parse will transform from json to a hash

ingredients = []

ingredients_parsed["drinks"].each do |ingredient|
  ingredients << Ingredient.create(name: ingredient.values.first)
end
p 'Ingredients have been successfully created!'
