# frozen_string_literal: true

require "test_helper"

class FormErrorsComponentTest < ViewComponent::TestCase
  def setup # rubocop:disable Naming/PredicateMethod
    @model = Recipe.new
    @model.valid?

    @valid_model = recipes(:one)
    @valid_model.valid?
  end

  def test_component_renders
    render_inline(FormErrorsComponent.new(model: @model))

    assert_text("Oops, couldn't save this Recipe", normalize_ws: true)
  end

  def test_component_renders_with_valid_model
    render_inline(FormErrorsComponent.new(model: @valid_model))

    refute_text("Oops, couldn't save this Recipe", normalize_ws: true)
  end
end
