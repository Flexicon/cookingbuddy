# frozen_string_literal: true

class RecipesController < ApplicationController
  before_action :set_recipe, only: [:show]

  def index
    @recipes = Recipe.all
  end

  def show
  end

  def by_category
    @recipes = Recipe.where(category: params[:category])
  end

  private

  def set_recipe
    @recipe = Recipe.find(params[:id])
  end
end
