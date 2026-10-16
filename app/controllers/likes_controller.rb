class LikesController < ApplicationController
  def create
    user = User.find_by(uid: session[:login_uid])
    return redirect_to root_path unless user
    tweet = Tweet.find(params[:tweet_id])
    user.like_tweets << tweet
    redirect_to root_path
  end

    def destroy
    user = User.find_by(uid: session[:login_uid])
    return redirect_to root_path unless user
    tweet = Tweet.find(params[:id])
    tweet.likes.find_by(user_id: user.id)&.destroy
    redirect_to root_path
  end
end