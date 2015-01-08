class Vote < ActiveRecord::Base
  belongs_to :review
  belongs_to :user

  validates_uniqueness_of :choice, scope: [:user_id, :review_id]
end
