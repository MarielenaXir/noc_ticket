class CreateTickets < ActiveRecord::Migration
  def change
    create_table :tickets do |t|
      t.string :name
      t.text :description
      t.string :socket
      t.string :phone
      t.string :state
      t.references :user
      t.references :technical

      t.timestamps
    end
    add_index :tickets, :user_id
    add_index :tickets, :technical_id
  end
end
