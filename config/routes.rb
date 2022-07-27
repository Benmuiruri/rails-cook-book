Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "main#index"
  resources :recipes, except: [:update] do
    resources :recipe_foods, only: [:create, :destroy] do
      get 'general_shopping_list', to: 'general_shopping_list#show'
    end
  end
  resources :foods, except: [:update]
  get 'my_recipes', to: 'recipes#index'
  get 'public_recipes', to: 'recipes#public_recipes'
  
end
