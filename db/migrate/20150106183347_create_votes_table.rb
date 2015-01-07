class CreateVotesTable < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.boolean :up_vote, null: false, default: false
      t.boolean :down_vote, null: false, default: false
      t.integer :review_id
      t.integer :user_id
      t.timestamps
    end
  end
end
