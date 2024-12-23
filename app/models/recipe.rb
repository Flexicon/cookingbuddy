# frozen_string_literal: true

class Recipe < ApplicationRecord
  has_many :ingredients, -> { includes :product }, dependent: :destroy, inverse_of: :recipe
  has_many :products, through: :ingredients

  belongs_to :protein, -> { where category: :protein },
    class_name: "Product", optional: true, inverse_of: :recipes_as_protein

  belongs_to :carbohydrate, -> { where category: :carbohydrate },
    class_name: "Product", optional: true, inverse_of: :recipes_as_carbohydrate

  has_one_attached :image do |attachable|
    attachable.variant :thumb, resize_to_limit: [120, 120], preprocessed: true
  end

  has_rich_text :instructions

  enum :category, {breakfast: 0, lunch: 1, dinner: 2, supper: 3, dessert: 4}

  validates :name, :category, presence: true
  validates :name, uniqueness: true
  validate :protein_must_be_a_protein
  validate :carbohydrate_must_be_a_carbohydrate

  def image_or_placeholder(variant: nil, placeholder_options: {})
    if image.attached?
      variant ? image.variant(variant) : image
    else
      ImagesHelper.placeholder_image_url(key: name, **placeholder_options)
    end
  end

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
