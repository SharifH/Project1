class HomeController < ApplicationController
  before_filter :authenticate_user!

  def index
    @tweets = current_user.pull_tweets
    if current_user.bartender?
      redirect_to contests_path
    elsif current_user.admin?
      redirect_to admins_path
    end

  end

end