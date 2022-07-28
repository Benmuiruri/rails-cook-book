class AddQuantityDefaultInFood < ActiveRecord::Migration[7.0]
  def change
    change_column_default :foods, :quantity, from: nil, to: 0.0
  end
end
