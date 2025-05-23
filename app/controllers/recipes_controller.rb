# frozen_string_literal: true

class RecipesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_recipe, only: [:show, :edit, :update, :destroy]

  def index
    @recipes = Recipe.includes(:image_attachment).all
  end

  def show
  end

  def new
    @recipe = Recipe.new
  end

  def edit
  end

  def create
    @recipe = Recipe.new(recipe_params)

    if @recipe.save
      flash[:notice] = t(".success", name: @recipe.name)

      respond_to do |format|
        format.turbo_stream
        format.html { redirect_to @recipe }
      end
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @recipe.update(recipe_params)
      flash.now[:notice] = t(".success")

      respond_to do |format|
        format.turbo_stream
        format.html { redirect_to @recipe }
      end
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @recipe.destroy
    redirect_to recipes_path, notice: t(".success", name: @recipe.name)
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

  def recipe_params
    params.expect(recipe: [:name, :category, :image, :instructions])
  end
end
