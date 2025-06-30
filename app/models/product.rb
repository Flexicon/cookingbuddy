# frozen_string_literal: true

class Product < ApplicationRecord
  has_many :ingredients, dependent: :destroy
  has_many :recipes, through: :ingredients

  enum :category, {general: 0, protein: 1, carbohydrate: 2}

  validates :name, :category, presence: true
  validates :name, uniqueness: true
end
