class VotesController < ApplicationController
  before_action :authenticate_user!

  def update
    @review = Review.find(params[:review_id])
    @site = @review.site
    @vote = Vote.find_or_initialize_by(review: @review, user: current_user)
    @vote.attributes = vote_params
    @vote.save!
    redirect_to site_path(@site)
    flash[:alert] = "Vote has been recorded"
  end

  private

  def vote_params
    params.require(:vote).permit(:choice, :review_id, :user_id, :score)
  end
end
