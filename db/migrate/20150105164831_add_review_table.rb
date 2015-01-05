class AddReviewTable < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.text :comment
      t.integer :rating, null: false
      t.timestamps
    end
  end
end
