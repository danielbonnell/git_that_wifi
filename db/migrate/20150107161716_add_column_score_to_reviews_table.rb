class AddColumnScoreToReviewsTable < ActiveRecord::Migration
  def change
    add_column :reviews, :score, :integer, default: 0, null: false
  end
end
