class AddSitesTable < ActiveRecord::Migration
  def change
    create_table :sites do |t|
      t.string :name, null: false
      t.string :address, null: false
      t.string :city, null: false
      t.string :state, null: false
      t.string :zip, null: false
      t.text :description, null: false
      t.string :phone, null: false
      t.string :url
      t.string :days_open
      t.string :open_time
      t.string :close_time
      t.integer :cost_rating
      t.integer :user_id, null: false
      t.timestamps
    end
  end
end
