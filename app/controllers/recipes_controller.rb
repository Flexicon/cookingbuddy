# frozen_string_literal: true

class RecipesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_recipe, only: [
    :show, :edit, :edit_instructions, :edit_name, :edit_image,
    :update, :update_category, :update_instructions, :update_name, :update_image,
    :destroy, :remove_image
  ]

  def index
    @filter = RecipeFilterForm.new(filter_params)
    @recipes = @filter.results.includes(:image_attachment)
  end

  def show
  end

  def new
    @recipe = Recipe.new(category: :lunch)
  end

  def edit
  end

  def edit_name
  end

  def edit_instructions
  end

  def edit_image
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

  def update_name
    if @recipe.update(name_params)
      respond_to do |format|
        format.turbo_stream
        format.html { redirect_to @recipe, notice: t(".success", name: @recipe.name) }
      end
    else
      render :edit_name, status: :unprocessable_entity
    end
  end

  def update_instructions
    if @recipe.update(instructions_params)
      respond_to do |format|
        format.turbo_stream
        format.html { redirect_to @recipe, notice: t(".success", name: @recipe.name) }
      end
    else
      render :edit_instructions, status: :unprocessable_entity
    end
  end

  def update_category
    if @recipe.update(category_params)
      respond_to do |format|
        format.turbo_stream
        format.html { redirect_to @recipe, notice: t(".success", name: @recipe.name, category: @recipe.category) }
      end
    else
      respond_to do |format|
        format.turbo_stream { flash.now[:error] = @recipe.errors.full_messages.to_sentence }
        format.html { render :show, status: :unprocessable_entity }
      end
    end
  end

  def update_image
    if @recipe.update(image_params)
      respond_to do |format|
        format.turbo_stream
        format.html { redirect_to @recipe, notice: t(".success", name: @recipe.name) }
      end
    else
      render :edit_image, status: :unprocessable_entity
    end
  end

  def remove_image
    @recipe.image.purge

    respond_to do |format|
      format.turbo_stream
      format.html { redirect_to @recipe, notice: t(".success", name: @recipe.name) }
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

  def name_params
    params.expect(recipe: [:name])
  end

  def instructions_params
    params.expect(recipe: [:instructions])
  end

  def category_params
    {category: params.expect(:category)}
  end

  def image_params
    params.expect(recipe: [:image])
  end

  def filter_params
    params.fetch(:filter, {}).permit(:search, :category, :protein_id, :carbohydrate_id)
  end
end
