class FoodsController < ApplicationController
  before_action :authenticate_user!

  def index
    if user_signed_in?
      @foods = Food.includes(:user).where(user_id: current_user.id)
    else
      redirect_to user_session_path
    end
  end

  def new
    @food = Food.new
  end

  def create
    @food = current_user.foods.build(food_params)

    if @food.save
      redirect_to foods_url, notice: 'Food was successfully created.'
    else
      render :new, alert: 'Food could not be created'
    end
  end

  def destroy
    @food.destroy
    redirect_to foods_url, notice: 'Food was successfully destroyed.'
  end

  private

  def set_food
    @food = Food.find(params[:id])
  end

  def food_params
    params.require(:food).permit(:name, :measurement_unit, :price)
  end
end
