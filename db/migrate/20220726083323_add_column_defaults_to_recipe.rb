class AddColumnDefaultsToRecipe < ActiveRecord::Migration[7.0]
  def change
    change_column_default :recipes, :preparation_time, from: nil, to: 0
    change_column_default :recipes, :cooking_time, from: nil, to: 0
    change_column_default :recipes, :public, from: nil, to: false
  end
end
