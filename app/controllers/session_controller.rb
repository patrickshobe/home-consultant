class SessionController < ApplicationController
  def new
    session[:user] = nil
  end

  def destroy
    session[:user] = nil
    redirect_to '/'
  end

  def create
    check_login
    result = MembersService.new(params[:user][:address], params[:password])
    if result.success
      session[:user] = result.success
      session[:email] = params[:user][:address]
      redirect_to main_page_index_path(request.parameters)
    else
      flash.now[:error] = result.error
      render :new
    end
  end

  private
  def check_login
    redirect_to '/main_page' if session[:user]
  end
end
