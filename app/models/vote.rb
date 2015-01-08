class Vote < ActiveRecord::Base
  after_save :total_score
  belongs_to :review
  belongs_to :user

  validates_uniqueness_of :choice, scope: [:user_id, :review_id]

  private

  def total_score
    score = Votes.score.sum(:choice)
    self.update_attributes(:score => score)
  end

end

