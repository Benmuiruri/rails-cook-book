class Recipe < ApplicationRecord
  belongs_to :user
  has_many :recipe_foods

  validates :name, presence: true

  def public_recipes
    @recipes = Recipe.where(public: true)
  end
end
