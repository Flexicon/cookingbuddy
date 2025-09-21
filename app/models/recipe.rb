# frozen_string_literal: true

class Recipe < ApplicationRecord
  has_many :ingredients, -> { includes :product }, dependent: :destroy, inverse_of: :recipe
  has_many :products, through: :ingredients

  has_one_attached :image do |attachable|
    attachable.variant :thumb, resize_to_limit: [120, 120], preprocessed: true
  end

  has_rich_text :instructions

  enum :category, { breakfast: 0, lunch: 1, dinner: 2, supper: 3, dessert: 4 }

  validates :name, :category, presence: true
  validates :name, uniqueness: true

  def image_or_placeholder(variant: nil, placeholder_options: {})
    if image.attached?
      variant ? image.variant(variant) : image
    else
      ImagesHelper.placeholder_image_url(key: id, **placeholder_options)
    end
  end
end
