class UsersController < ApplicationController
  before_action :user_signed_in?, only: [:following, :followers]
  
  def show
    @user = User.find params[:id]
    @followers = @user.followers
    @following = @user.following
  end
  
end
