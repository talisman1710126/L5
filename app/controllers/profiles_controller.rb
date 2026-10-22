class ProfilesController < ApplicationController
  before_action :require_login

  def edit
    @profile = @user.profile || @user.build_profile
  end

  def update
    @profile = @user.profile || @user.build_profile
    @profile.message = params[:profile][:message]
    if @profile.save
      redirect_to root_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @user.profile&.destroy
    redirect_to root_path
  end

  private

  def require_login
    @user = User.find_by(uid: session[:login_uid])
    redirect_to root_path unless @user
  end
end