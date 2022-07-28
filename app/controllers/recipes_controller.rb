class RecipesController < ApplicationController
  before_action :authenticate_user!, except: :public_recipes

  def public_recipes
    @recipes = Recipe.public_recipes
  end

  def show
    @recipe = Recipe.includes(:foods).find(params[:id])
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

  def update
    @recipe = Recipe.find(params[:id])
    if @recipe.public
      @recipe.update(public: false)
      flash[:notice] = 'You have updated the recipe status to private'
    else
      @recipe.update(public: true)
      flash[:notice] = 'You have updated the recipe status to public'
    end
    redirect_to recipe_path(@recipe)
  end

  def destroy
    @recipe = Recipe.find(params[:id])
    @recipe.destroy
    redirect_to recipes_path, notice: "Successfully deleted the recipe #{@recipe.name}."
  end

  def my_recipes
    @recipes = Recipe.where(user_id: current_user.id)
  end

  private

  def recipe_params
    params.require(:recipe).permit(:name, :preparation_time, :cooking_time, :description, :public)
  end
end
