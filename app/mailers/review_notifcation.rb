class ReviewNotification < ApplicationMailer
  def receipt(review)
    @greeting = "Hi"

    mail to: review.user.email, subject: "New Review Posted"
  end
end
