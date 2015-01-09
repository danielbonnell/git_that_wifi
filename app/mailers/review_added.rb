class ReviewAdded < ApplicationMailer
  def receipt(site)
    @site = site

    mail to: site.user.email, subject: "New Review Posted"
  end
end
