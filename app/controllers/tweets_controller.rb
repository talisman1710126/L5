class TweetsController < ApplicationController
  def create
    user = User.find_by(uid: session[:login_uid])
    if user
      Tweet.create(message: params[:tweet][:message], user: user)
    end
    redirect_to root_path
  end

  def destroy
    Tweet.find(params[:id]).destroy
    redirect_to root_path
  end
end