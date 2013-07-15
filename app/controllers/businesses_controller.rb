class BusinessesController < ApplicationController

  def new
    @business = Business.new

  end

  def create
    @business = Business.new(params[:business])

    if @business.save
      redirect_to admins_path
    else
      flash[:notice] = "There was an error saving the business record"
    end
  end

  def show
    @users = []
    @business = Business.find(params[:id])
    @users = @business.users
    @users.each { |u|
      @bartender = u if u.bartender
    }

  end

  def edit
    @business = Business.find(params[:id])
  end

  def update
    @business = Business.find(params[:id])
    if @business.update_attributes(params[:business])
      redirect_to businesses_path
    else
      flash[:notice] = "Fucked up"
    end
  end
end