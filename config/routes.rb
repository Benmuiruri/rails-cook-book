Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "main#index"
  resources :recipes do
    resources :recipe_foods, only: [:create, :destroy]
  end
  resources :foods, except: [:update]
  get 'my_recipes', to: 'recipes#my_recipes'
  get 'public_recipes', to: 'recipes#public_recipes'
  resources :general_shopping_list, only: [:index]
end
