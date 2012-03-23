class CreateGizmos < ActiveRecord::Migration
  def change
    create_table :gizmos do |t|
      t.string :name
      t.text :description
      t.decimal :price
      t.boolean :enable
      t.timestamps
    end
  end
end
