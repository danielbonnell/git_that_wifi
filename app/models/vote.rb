class Vote < ActiveRecord::Base
  belongs_to :review
  belongs_to :user

  validates_uniqueness_of :choice, scope: [:user_id, :review_id]

  def update_score(review_id)
    review = Review.find(review_id)
    new_score = review.score += self.choice
    review.update(score: new_score)
  end
end
