# frozen_string_literal: true

class Ingredient < ApplicationRecord
  belongs_to :recipe
  belongs_to :product
end
