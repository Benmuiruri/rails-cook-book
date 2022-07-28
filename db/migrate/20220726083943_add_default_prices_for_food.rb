class AddDefaultPricesForFood < ActiveRecord::Migration[7.0]
  def change
    change_column_default :foods, :price, from: nil, to: 0.0
  end
end
