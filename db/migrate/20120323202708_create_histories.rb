class CreateHistories < ActiveRecord::Migration
  def change
    create_table :histories do |t|
      t.text :description
      t.references :ticket
      t.references :user
      t.text :state
      t.boolean :auto

      t.timestamps
    end
    add_index :histories, :ticket_id
    add_index :histories, :user_id
  end
end
