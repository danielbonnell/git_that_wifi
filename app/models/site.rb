class Site < ActiveRecord::Base
  belongs_to :user
  has_many :reviews
  validates :name, presence: true
  validates :address, presence: true
  validates :city, presence: true
  validates :state, presence: true
  validates :zip, presence: true
  validates :phone, presence: true
  validates :description, presence: true
  validates :user_id, presence: true
end
