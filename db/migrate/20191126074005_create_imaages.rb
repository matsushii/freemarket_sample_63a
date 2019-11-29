class CreateImaages < ActiveRecord::Migration[5.2]
  def change
    create_table :imaages do |t|
      t.string :image

      t.timestamps
    end
  end
end
