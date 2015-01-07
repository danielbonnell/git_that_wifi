class Site < ActiveRecord::Base
  belongs_to :user
  has_many :reviews, dependent: :destroy

  validates :name, presence: true
  validates :address, presence: true
  validates :city, presence: true
  validates :state, presence: true
  validates :zip, presence: true
  validates :phone, presence: true
  validates :description, presence: true
  validates :user_id, presence: true

  def review(user)
    self.review.create!(comment: "Great coffee!", rating: 4, user_id: user.id)
  end
  def reviewed
    # binding.pry
    if save
      ReviewAdded.receipt(self).deliver
      return true
    end
  end
end
