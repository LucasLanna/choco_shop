class AddDescriptiontoProduct < ActiveRecord::Migration[7.1]
  def change
    add_column :products, :name, :stock, :price, :description
  end
end
