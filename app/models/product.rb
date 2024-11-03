class Product < ApplicationRecord
  has_many :ingredients, dependent: :destroy
  has_many :recipes_as_protein, class_name: "Recipe", inverse_of: "protein", dependent: :nullify
  has_many :recipes_as_carbohydrate, class_name: "Recipe", inverse_of: "carbohydrate", dependent: :nullify

  enum :category, {general: 0, protein: 1, carbohydrate: 2}
end