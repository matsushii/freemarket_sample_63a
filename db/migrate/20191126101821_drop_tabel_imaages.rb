class DropTabelImaages < ActiveRecord::Migration[5.2]
  def change
    drop_table :imaages
  end
end
