class AdminsController < ApplicationController

  def index
    @users = User.all
    @businesses = Business.all
    @contests = Contest.all
    @prizes = Prize.all
  end
end