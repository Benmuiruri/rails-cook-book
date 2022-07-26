class FoodsController < ApplicationController
    def index
        if user_signed_in?
          @foods = Food.includes(:user).where(user_id: current_user.id)
        else
          redirect_to user_session_path
        end
      end 
end
