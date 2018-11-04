class RecipesController < ApplicationController
  def index
  end

  def show
    @recipe = Recipe.find(params[:id])
  end

  def new
    @recipe = Recipe.new
    @recipe.recipe_ingredients.build
    @ingredients = Ingredient.all.pluck(:name, :id)
  end

  def create
    @recipe = current_user.recipes.new(recipe_params)
    if @recipe.save
      redirect_to [current_user, @recipe], notice: 'Recipe added'
    else
      flash[:error] = 'Fail'
      render :new
    end
  end

  def edit
  end

  private

  def recipe_params
    params.require(:recipe).permit(:name, :cuisine, :category, :time, :serving_size,
      recipe_ingredients_attributes: [:id, :ingredient_id, :quantity])
  end
end
