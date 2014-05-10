class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :require_login, only: [:edit, :update, :destroy, :new]
  before_action :set_user
  
  def set_user
    if session[:user_id]
      @user = User.find(session[:user_id])
    elsif params[:id] and !request.env['PATH_INFO'].include?("article")
      @user = User.find(params[:id])
    end
  end
  
  private
  def not_authenticated
    redirect_to login_path, alert: "Please login first"
  end
end
