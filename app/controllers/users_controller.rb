class UsersController < ApplicationController
  before_action :user_signed_in?
  
  def show
    @user = User.find params[:id]
    @followers = @user.followers
    @following = @user.following
  end
  
end
