class TopController < ApplicationController
  def main
    @tweets = Tweet.all.order(created_at: :desc)
    @tweet = Tweet.new
  end

  def login
    user = User.find_by(uid: params[:uid])
    if user && user.authenticate(params[:pass])
      session[:login_uid] = user.uid
      redirect_to root_path
    else
      redirect_to root_path, alert: "ユーザIDかパスワードが違います"
    end
  end

  def logout
    session.delete(:login_uid)
    redirect_to root_path
  end
end