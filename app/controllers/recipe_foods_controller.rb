class RecipeFoodsController < ApplicationController
  before_action :authenticate_user!

  def create
    if recipe.user == current_user
      new_recipe_food = RecipeFood.new(recipe_food_params)
      recipe = Recipe.find(params[:recipe_id])
      new_recipe_food.recipe = recipe
      if new_recipe_food.save
        redirect_to recipe_path(recipe), notice: 'Food added to recip successfully.'
      else
        flash[:alert] = 'Something went wrong, food not added to recipe'
      end
    else
      flash[:alert] = 'Permission to add new food denied'
    end
     redirect_to recipe_path(recipe)
  end

  def destroy
  end
  
  private

  def recipe_food_params
    params.require(:recipe_food).permit(:food_id, :recipe_id, :quantity)
  end
end
