# frozen_string_literal: true

class Ingredient < ApplicationRecord
  belongs_to :recipe
  belongs_to :product

  validates :amount, presence: true

  def to_s
    "#{product.name} - #{amount} #{unit}"
  end
end
