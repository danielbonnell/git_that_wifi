class Review < ActiveRecord::Base
  paginates_per 10
  belongs_to :site
  belongs_to :user

  validates :rating, presence: true

  has_many :votes
  accepts_nested_attributes_for :votes

  def total_score
    votes.sum(:choice)
  end

  def self.sort_by_total_score
      Review.all.sort_by(&:total_score).reverse
  end
end
