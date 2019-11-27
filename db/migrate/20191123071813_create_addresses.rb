class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|
      t.string :postal_code, null: false
      t.string :prefecture,  null: false
      t.string :city,        null: false
      t.string :address,     null: false
      t.string :building
      t.timestamps
      t.references :user, foreign_key: true
    end
  end
end
