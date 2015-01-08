class SearchesController < ApplicationController
  def index
    @results = Site.search(params[:query])
  end
end
