class SessionController < ApplicationController
  def new
  end

  def create
    result = MembersService.new(params[:user][:address], params[:password])
    if result.success
      session[:user] = result.success

      redirect_to "/search/new"
    else
      flash[:notice] = "#{result.response[:data][:status]} error. #{result.response[:data][:error]}. Invalid Login. Please try again."
      render :new
    end
  end
end
