class ReviewNotification < ApplicationMailer
  def receipt(review)
    @review = review

    mail to: review.user.email, subject: "New Review Posted"
  end
end
