class RecipesController < ApplicationController
  def index 
    @recipes = Recipe.includes(:user).where(user_id: current_user.id)
  end

  def show
    @recipe = Recipe.includes(:user).find(params[:id])
  end

  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = Recipe.new(recipe_params)
    @recipe.user = current_user
    if @recipe.save
     redirect_to recipe_path(@recipe.id), notice: 'New recipe created successfully.'
    else
      flash[:alert] = 'Something went wrong, recipe not created'
      render :new, status: :unprocessable_entity
    end
  end

  private
  
  def recipe_params
    params.require(:recipe).permit(:name, :preparation_time, :cooking_time, :description, :public)
  end
end
