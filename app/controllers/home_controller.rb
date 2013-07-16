class HomeController < ApplicationController
  before_filter :authenticate_user!

  def index
    @tweets = current_user.pull_tweets
    current_user.save

  end

end