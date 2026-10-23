class LikesController < ApplicationController
  def create
    user = current_user
    return redirect_to root_path unless user
    tweet = Tweet.find(params[:tweet_id])
    user.like_tweets << tweet
    redirect_to root_path
  end

    def destroy
    user = current_user
    return redirect_to root_path unless user
    tweet = Tweet.find(params[:id])
    tweet.likes.find_by(user_id: user.id)&.destroy
    redirect_to root_path
  end
end