# frozen_string_literal: true

class RecipesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_recipe, only: [:show]

  def index
    @recipes = Recipe.all
  end

  def show
  end

  def by_category
    @category = params[:category]
    @recipes = Recipe.where(category: @category)

    respond_to do |format|
      format.html { redirect_to root_url }
      format.turbo_stream {}
    end
  end

  private

  def set_recipe
    @recipe = Recipe.find(params[:id])
  end
end
