class AddImageColumnToSitesTable < ActiveRecord::Migration
  def change
    add_column :sites, :image, :string
  end
end
