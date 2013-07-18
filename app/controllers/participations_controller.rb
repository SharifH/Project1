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
<<<<<<< HEAD
    binding.pry
    redirect_to contests_path

=======

    if current_user.save
      redirect_to contests_path
    end
>>>>>>> 20e8ac1... working
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

