class ChangeChoiceInVotesToInteger < ActiveRecord::Migration
  def change
    remove_column :votes, :choice
    add_column :votes, :choice, :integer, null: false
  end
end
