class Site < ActiveRecord::Base
  belongs_to :user
  validates_presence_of :name, :address, :city, :state, :zip, :phone, :description, :user_id
end
