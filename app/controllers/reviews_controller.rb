class ReviewsController < ApplicationController
  before_action :authenticate_user!
  def index
    # @reviews = Review.find_by(params[:site_id]).sort_by_total_score.page params[:page]

  end

  def new
    @site = Site.find(params[:site_id])
    @review = Review.new
    @user = current_user
  end

  def edit
    @site = Site.find(params[:site_id])
    @review = Review.find(params[:id])
    @user = current_user
  end

  def update
    @review = Review.find(params[:id])

    if @review.update(review_params)
      redirect_to @review.site, notice: "Review Updated Successfully"
    else
      render :edit
    end
  end

  def create
    @site = Site.find(params[:site_id])
    @review = Review.new(review_params)
    @review.site = @site
    @review.user = current_user
    if @review.save
      @review.site.reviewed
      redirect_to site_path(@review.site_id),
      notice: "Review Saved Successfully"
      # ReviewAdded.receipt(self).deliver
      # return true
    else
      render "new"
    end
  end

  def destroy
    @site = Site.find(params[:site_id])
    @review = Review.find(params[:id])
    if @review.destroy
      redirect_to site_path(@site), notice: "Review Deleted Successfully"
    end
  end

  private

  def review_params
    params.require(:review).permit(:comment, :rating, :user_id, :page)
  end
end
