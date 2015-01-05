class AddIndexToReviews < ActiveRecord::Migration
  def change
    add_index :reviews, :site_id
  end
end
