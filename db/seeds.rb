# frozen_string_literal: true

# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# Setup Users
User.create!(email: "foo@bar.com", password: "testing", password_confirmation: "testing")

# Setup Products
carrot = Product.create!(name: "Carrot", category: :general)
cinnamon = Product.create!(name: "Cinnamon", category: :general)
tofu = Product.create!(name: "Tofu", category: :protein)
potato = Product.create!(name: "Potato", category: :carbohydrate)
flour = Product.create!(name: "Flour", category: :carbohydrate)
onion = Product.create!(name: "Onion", category: :general)

# Setup Recipes
carrot_cake = Recipe.create!(name: "Carrot Cake", category: :dessert)
cinnamon_roll = Recipe.create!(name: "Cinnamon Roll", category: :lunch)
matar_tofu = Recipe.create!(name: "Matar Tofu", category: :lunch)
tortilla_pizza = Recipe.create!(name: "tortilla_pizza", category: :lunch)
tofu_scramble = Recipe.create!(name: "Tofu Scramble", category: :dinner)
potato_salad = Recipe.create!(name: "Potato Salad", category: :supper)

# Setup Ingredients
Ingredient.create!(amount: 65, unit: "g", recipe: carrot_cake, product: carrot)
Ingredient.create!(amount: 140, unit: "g", recipe: carrot_cake, product: flour)
Ingredient.create!(amount: 2, unit: "tbsp", recipe: cinnamon_roll, product: cinnamon)
Ingredient.create!(amount: 140, unit: "g", recipe: cinnamon_roll, product: flour)
Ingredient.create!(amount: 100, unit: "g", recipe: matar_tofu, product: tofu)
Ingredient.create!(amount: 1, unit: "pcs", recipe: matar_tofu, product: onion)
Ingredient.create!(amount: 100, unit: "g", recipe: tortilla_pizza, product: tofu)
Ingredient.create!(amount: 100, unit: "g", recipe: tofu_scramble, product: tofu)
Ingredient.create!(amount: 1, unit: "pcs", recipe: tofu_scramble, product: onion)
Ingredient.create!(amount: 450, unit: "g", recipe: potato_salad, product: potato)
