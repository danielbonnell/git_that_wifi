class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @sites = @user.sites
  end
end
