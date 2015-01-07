require 'rails_helper'
RSpec.describe ReviewAdded, :type => :model do

  describe 'valid review' do
    it 'posts a valid' do
      review = FactoryGirl.build(:review)
      review.should be_valid
    end

    it "receives an email" do
      ActionMailer::Base.deliveries = []
      prev_mail_count = ActionMailer::Base.deliveries.count
      FactoryGirl.build(:site).reviewed
      expect(ActionMailer::Base.deliveries.count).to eql(prev_mail_count + 1)
    end
  end

  describe 'invalid review' do
    it 'posts an invalid review' do
      review = FactoryGirl.build(:review, rating: nil)
      review.should_not be_valid
    end
  end
end
