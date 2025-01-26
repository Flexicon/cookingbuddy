# frozen_string_literal: true

module Recipes
  class IngredientsController < ApplicationController
    before_action :authenticate_user!
    before_action :set_recipe
    before_action :set_products, only: %i[new edit create update]
    before_action :set_ingredient, only: %i[edit update destroy]

    def new
      @ingredient = @recipe.ingredients.build
    end

    def edit
    end

    def create
      @ingredient = @recipe.ingredients.build(ingredient_params)

      if @ingredient.save
        respond_to do |format|
          format.turbo_stream
          format.html { redirect_to @recipe }
        end
      else
        render :new, status: :unprocessable_entity
      end
    end

    def update
      if @ingredient.update(ingredient_params)
        respond_to do |format|
          format.turbo_stream
          format.html { redirect_to @recipe }
        end
      else
        render :edit, status: :unprocessable_entity
      end
    end

    def destroy
      @ingredient.destroy
      respond_to do |format|
        format.turbo_stream
        format.html { redirect_to @recipe }
      end
    end

    private

    def set_recipe
      @recipe = Recipe.find(params[:recipe_id])
    end

    def set_products
      @products = Product.order(name: :asc).all
    end

    def set_ingredient
      @ingredient = Ingredient.find(params[:id])
    end

    def ingredient_params
      params.expect(ingredient: [:product_id, :amount, :unit])
    end
  end
end
