class RecipeFoodsController < ApplicationController
  before_action :authenticate_user!

  def new
    @recipe_food = RecipeFood.new
  end

  def create
    recipe = Recipe.find(params[:recipe_id])
    new_recipe_food = RecipeFood.new(recipe_food_params)
    new_recipe_food.recipe = recipe

    new_recipe_food.save!
    redirect_to recipe_path(recipe)
  end

  def destroy
  end
  
  private

  def recipe_food_params
    params.permit(:food_id, :quantity)
  end
end
