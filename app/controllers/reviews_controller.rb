class ReviewsController < ApplicationController
  before_action :authenticate_user!
  def index
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
    @review = Review.find_or_initialize_by(site: @site, user: current_user)
    if @review.new_record?
      @review.attributes = review_params
      if @review.save
        @review.site.reviewed
        redirect_to site_path(@review.site_id),
        notice: "Review Saved Successfully"
      else
        render "new"
      end
    else
      redirect_to site_path(@review.site),
      notice: "You have already reviewed this site!"
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
