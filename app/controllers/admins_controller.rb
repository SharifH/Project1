class AdminsController < ApplicationController

  def index
    @users = User.all
    @businesses = Business.all
  end
end