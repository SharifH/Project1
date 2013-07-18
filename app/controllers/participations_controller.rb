class ParticipationsController < ApplicationController

  def new
    @user = current_user
    @participation = Participation.new
  end

  def index
    @participation = Participation.all
  end

  def create

    @participation = Participation.new(params[:participation])
    current_user.contests << Contest.where(:id => @participation.contest_id)
    redirect_to contests_path

  end

  def destroy
    @participation = Participation.find(params[:id])
    if @participation.destroy
      redirect_to contests_path
    else
      flash[:notice] = "Error"
      redirect_to :back
    end
  end


end

