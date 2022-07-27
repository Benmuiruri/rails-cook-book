class ChangeQuantityTypeOfFood < ActiveRecord::Migration[7.0]
  def change
    remove_column :foods, :quantity, :string
  end
end
