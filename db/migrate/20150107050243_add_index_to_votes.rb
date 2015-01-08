class AddIndexToVotes < ActiveRecord::Migration
  def change
    add_index :votes, [:user_id, :review_id], unique: true
    add_index :votes, :review_id
  end
end
