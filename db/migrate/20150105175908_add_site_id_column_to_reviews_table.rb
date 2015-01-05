class AddSiteIdColumnToReviewsTable < ActiveRecord::Migration
  def change
    add_column :reviews, :site_id, :integer, null: false
  end
end
