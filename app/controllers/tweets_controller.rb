class TweetsController < ApplicationController
  def index
    @tweets = Tweet.all.order(created_at: :desc)
    @tweet = Tweet.new
  end

  def create
    # 仮：ログイン機能ができたら、ログイン中のユーザに置き換える
    user = User.first
    tweet = Tweet.new(message: params[:tweet][:message], user: user)
    tweet.save
    redirect_to tweets_path
  end

  def destroy
    Tweet.find(params[:id]).destroy
    redirect_to tweets_path
  end
end