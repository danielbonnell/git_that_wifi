class ChangeVotesTableToOneVoteColumn < ActiveRecord::Migration
  def change
    remove_column :votes, :up_vote
    remove_column :votes, :down_vote
    add_column :votes, :choice, :boolean, null: false
  end
end
