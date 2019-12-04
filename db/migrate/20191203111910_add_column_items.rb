class AddColumnItems < ActiveRecord::Migration[5.2]
  def change
    add_column :items, :condition,     :integer, null: false
    add_column :items, :shipping_fee,  :integer, null: false
    add_column :items, :shipping_date, :integer, null: false
    add_column :items, :shipping_from, :integer, null: false
  end
end
