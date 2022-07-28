class GeneralShoppingListController < ApplicationController
  before_action :authenticate_user!
  def index
    @food_amount = 0
    @total_price = 0
    @recipe_foods = []
    @recipes = current_user.recipes

    @recipes.includes(:recipe_foods).each do |recipe|
      @food_amount += recipe.recipe_foods.count
      @recipe_foods << recipe.recipe_foods
      recipe.recipe_foods.includes(:food).each do |recipe_food|
        @total_price += recipe_food.food.price * recipe_food.quantity
      end
    end
  end
end
