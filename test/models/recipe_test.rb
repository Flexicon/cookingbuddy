# frozen_string_literal: true

require "test_helper"

class RecipeTest < ActiveSupport::TestCase
  should "create new recipe" do
    assert_difference("Recipe.count") do
      Recipe.create!(name: "Tikka Masala", category: :dinner)
    end
  end
end
