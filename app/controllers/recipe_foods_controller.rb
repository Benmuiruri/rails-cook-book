class RecipeFoodsController < ApplicationController
  before_action :authenticate_user!

  def new
    @recipe_food = RecipeFood.new
  end

  def create
    recipe = Recipe.find(params[:recipe_id])
    if recipe.user == current_user
      new_recipe_food = RecipeFood.new(recipe_food_params)
      new_recipe_food.recipe = recipe
      if new_recipe_food.save
        redirect_to recipe_path(recipe), notice: 'Food added to recipe successfully.'
      else
        flash[:alert] = 'Something went wrong, food not added to recipe'
      end
    else
      flash[:alert] = 'Permission to add new food denied'
    end
  end

  def destroy
    @recipe_food = RecipeFood.includes(:recipe).find(params[:id])
    @recipe_food.destroy
    redirect_to recipe_path(@recipe_food.recipe), notice: "Successfully deleted the food #{@recipe_food.food.name}."
  end

  private

  def recipe_food_params
    params.permit(:food_id, :quantity)
  end
end
