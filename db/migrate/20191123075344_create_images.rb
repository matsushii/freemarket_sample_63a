class CreateImages < ActiveRecord::Migration[5.2]
  def change
    create_table :images do |t|
      t.string :image, null: false, default: ""
      t.timestamps
      t.references :item, foreign_key: true
    end
  end
end
