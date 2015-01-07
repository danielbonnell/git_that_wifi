class Review < ActiveRecord::Base
  belongs_to :site
  belongs_to :user

  validates :rating, presence: true

  # def reviewed
  #   binding.pry
  #   if save
  #     ReviewAdded.receipt(self).deliver
  #     return true
  #   end
  # end
end
