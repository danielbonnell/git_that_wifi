class Review < ActiveRecord::Base
  belongs_to :site
  belongs_to :user

  has_many :votes
  accepts_nested_attributes_for :votes

  def total_score
    votes.sum(:choice)
  end
end
