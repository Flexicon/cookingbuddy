# frozen_string_literal: true

class RecipeListSkeletonComponent < ViewComponent::Base
  def initialize(count: 3)
    @count = count
  end
end
