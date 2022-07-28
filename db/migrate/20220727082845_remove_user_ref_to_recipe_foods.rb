class RemoveUserRefToRecipeFoods < ActiveRecord::Migration[7.0]
  def change
    remove_reference :recipe_foods, :user, foreign_key: true, index: false
  end
end
