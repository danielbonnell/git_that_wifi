class Site < ActiveRecord::Base
  paginates_per 10
  belongs_to :user
  has_many :reviews, dependent: :destroy
  accepts_nested_attributes_for :reviews

  validates :name, presence: true
  validates :address, presence: true
  validates :city, presence: true
  validates :state, presence: true
  validates :zip, presence: true
  validates :phone, presence: true
  validates :description, presence: true
  validates :user_id, presence: true

  def reviewed
    if save
      ReviewAdded.receipt(self).deliver
      return true
    end
  end
end