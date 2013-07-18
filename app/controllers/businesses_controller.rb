class BusinessesController < ApplicationController


  def new
    @business = Business.new
  end

  def create
    @bartender = User.find(params[:business][:bartender][:id])
    params[:business].delete(:bartender)
    @business = Business.new(params[:business])
    @business.save

    @bartender.business_id = @business.id
    @bartender.bartender = true
    @bartender.save

    if @business
      redirect_to admins_path
    else
      flash[:notice] = "There was an error saving the business record"
    end
  end

  def index
    @business = Business.all
  end

  def show
    @bartenders = User.where(:business_id => params[:id], :bartender => true)
    @business = Business.find(params[:id])


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

  def destroy
    @business = Business.find(params[:id])
    if @business.destroy
      redirect_to businesses_path
    else
      flash[:notice] = "Error destroying business record"
    end
  end

end