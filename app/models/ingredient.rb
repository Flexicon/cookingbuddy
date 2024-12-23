# frozen_string_literal: true

class Ingredient < ApplicationRecord
  belongs_to :recipe
  belongs_to :product

  enum :unit, {
    g: "g",
    ml: "ml",
    pcs: "pcs",
    kg: "kg",
    l: "l",
    tsp: "tsp",
    tbsp: "tbsp",
    cup: "cup"
  }, prefix: true

  validates :unit, :amount, presence: true

  def to_s
    "#{product.name} - #{amount} #{unit}"
  end
end
