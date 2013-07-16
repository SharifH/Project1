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
    @business = Business.find(params[:id])
    @bartender = User.where(:business_id => params[:id], :bartender => true)
  end

  def edit
    @business = Business.find(params[:id])
  end

  def update
    @business = Business.find(params[:id])
    @bartender = User.find(params[:business][:bartender][:id])
    @bartender.business_id = @business.id
    @bartender.bartender = true
    @bartender.save
    params[:business].delete(:bartender)
    if @business.update_attributes(params[:business])
      redirect_to businesses_path
    else
      flash[:notice] = "Fucked up"
    end
  end
end