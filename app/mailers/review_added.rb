class ReviewAdded < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.review_added.receipt.subject
  #
  def receipt(review)
    @greeting = "Hi"

    mail to: review.user.email,
      subject: "New Review Posted"
  end
end
