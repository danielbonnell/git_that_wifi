class Site < ActiveRecord::Base
  validates_presence_of :name, :address, :city, :state, :zip, :phone, :description, :user_id
end
