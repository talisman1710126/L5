class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(
      uid: params[:user][:uid],
      pass: BCrypt::Password.create(params[:user][:pass])
    )
    if @user.save
      session[:login_uid] = @user.uid
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    User.find(params[:id]).destroy
    redirect_to users_path
  end
end