class SearchController < ApplicationController

  def new
  end

  def create
    if params[:address] == ""
      flash[:notice] = "Address Empty."
      redirect_to new_search_path
    end

  end
end
