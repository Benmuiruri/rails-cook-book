class RemoveQuantityColumnOfRecipeFoods < ActiveRecord::Migration[7.0]
  def change
    remove_column :recipe_foods, :quantity, :string
  end
end
