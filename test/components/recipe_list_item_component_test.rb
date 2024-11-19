# frozen_string_literal: true

require "test_helper"

class RecipeListItemComponentTest < ViewComponent::TestCase
  def setup
    @recipe = recipes(:one)
  end

  def test_component_renders
    render_inline(RecipeListItemComponent.new(recipe: @recipe))

    assert_text(@recipe.name)
    assert_text(@recipe.category.capitalize)
  end
end
