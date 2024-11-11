# frozen_string_literal: true

require "test_helper"

class RecipeTest < ActiveSupport::TestCase
  should "create new recipe" do
    assert_difference("Recipe.count") do
      Recipe.create!(name: "Tikka Masala", category: :dinner)
    end
  end

  should "create new recipe including protein and carbohydrate" do
    assert_difference("Recipe.count") do
      Recipe.create!(name: "Tikka Masala", category: :dinner, protein: products(:protein), carbohydrate: products(:carbohydrate))
    end
  end

  should "validate recipe with carbohydrate as protein" do
    recipe = Recipe.new(name: "Crazy Masala", category: :supper, carbohydrate: products(:protein))
    assert_not recipe.valid?
    assert_equal({carbohydrate: ["must be a product with a category of carbohydrate"]}, recipe.errors.messages)
  end

  should "validate recipe with protein as carbohydrate" do
    recipe = Recipe.new(name: "Crazy Masala", category: :lunch, protein: products(:carbohydrate))
    assert_not recipe.valid?
    assert_equal({protein: ["must be a product with a category of protein"]}, recipe.errors.messages)
  end
end
