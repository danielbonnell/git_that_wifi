class VotesController < ApplicationController
  def index
  end
  def create
    @sites = Site.find(params[:site_id])
    @review = Review.find(params[:review_id])
    @review.site = @site
    @vote = Vote.new(vote_params)
      if @vote.save
        redirect_to site_path(@review.site_id),
          notice: "Vote Saved Successfully"
      else
        render "show"
      end
  end
  private
  def vote_params
    params.require(:vote).permit(:up_vote, :down_vote)
  end

end

