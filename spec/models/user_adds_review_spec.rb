require "rails_helper"
RSpec.describe ReviewAdded, :type => :model do

  it "posts a valid review" do
    review = FactoryGirl.build(:review)
    review.should be_valid
  end

  it "receives an email" do
    ActionMailer::Base.deliveries = []
    prev_mail_count = ActionMailer::Base.deliveries.count
    FactoryGirl.build(:site).reviewed
    expect(ActionMailer::Base.deliveries.count).to eql(prev_mail_count + 1)
  end

  it "posts an invalid review" do
    review = FactoryGirl.build(:review, rating: nil)
    review.should_not be_valid
  end
end
