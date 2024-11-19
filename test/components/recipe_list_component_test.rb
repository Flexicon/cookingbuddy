# frozen_string_literal: true

require "test_helper"

class RecipeListComponentTest < ViewComponent::TestCase
  def setup
    @recipes = [recipes(:one), recipes(:two)]
  end

  def test_component_renders
    render_inline(RecipeListComponent.new(recipes: @recipes))

    assert_text(@recipes.first.name)
    assert_text(@recipes.second.name)
  end
end
