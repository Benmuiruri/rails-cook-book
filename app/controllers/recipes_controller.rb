class RecipesController < ApplicationController
  def index 
    @recipes = Recipe.includes(:user).where(user_id: current_user.id)
  end
end
