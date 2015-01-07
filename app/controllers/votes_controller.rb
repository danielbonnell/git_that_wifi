class VotesController < ApplicationController
  def index
  end

  def create
    @review = Review.find(params[:review_id])
    @site = @review.site
    @vote = Vote.new(vote_params)
    @vote.review = @review
    @vote.user = current_user
    # Instead of update method
    begin
      if @vote.save
        redirect_to site_path(@site)
        flash[:alert] = "Vote has been recorded"
      else
        redirect_to site_path(@site)
        flash[:alert] = "Vote Already Recorded"
      end
    rescue
      @change_vote = Vote.find_by(user_id: current_user.id, review_id: params[:review_id])
      @change_vote.update(vote_params)
      redirect_to site_path(@site)
      flash[:alert] = "Vote Changed"
    end

  end

  private

  def vote_params
    params.require(:vote).permit(:choice, :review_id, :user_id)
  end

end
