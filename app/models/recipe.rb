class Recipe < ApplicationRecord
  has_many :ingredients, dependent: :destroy

  belongs_to :protein, -> { where category: :protein },
    class_name: "Product", optional: true, inverse_of: :recipes_as_protein

  belongs_to :carbohydrate, -> { where category: :carbohydrate },
    class_name: "Product", optional: true, inverse_of: :recipes_as_carbohydrate

  enum :category, {breakfast: 0, lunch: 1, dinner: 2, supper: 3, dessert: 4}

  validate :protein_must_be_a_protein
  validate :carbohydrate_must_be_a_carbohydrate

  private

  def protein_must_be_a_protein
    if protein && !protein.protein?
      errors.add(:protein, "must be a product with a category of protein")
    end
  end

  def carbohydrate_must_be_a_carbohydrate
    if carbohydrate && !carbohydrate.carbohydrate?
      errors.add(:carbohydrate, "must be a product with a category of carbohydrate")
    end
  end
end
