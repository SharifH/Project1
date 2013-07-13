class HomeController < ApplicationController
  before_filter :authenticate_user!

  def index
    @shalom = "Hello World"

  end

end