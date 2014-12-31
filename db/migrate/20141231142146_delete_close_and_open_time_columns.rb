class DeleteCloseAndOpenTimeColumns < ActiveRecord::Migration
  def change
    remove_column :sites, :open_time, :string
    remove_column :sites, :close_time, :string
    remove_column :sites, :days_open, :string
  end
end
