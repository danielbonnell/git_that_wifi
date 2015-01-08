class Review < ActiveRecord::Base
  paginates_per 10
  belongs_to :site
  belongs_to :user

  validates :rating, presence: true

  has_many :votes
  accepts_nested_attributes_for :votes
end
