class ContestsController < ApplicationController

  def new
    if current_user.admin
      @contest = Contest.new
      @contest.prizes.build
    else
      redirect_to '/'
    end
  end


  def create
    @contest = Contest.new(params[:contest])
    @contest.prizes.build(params[:prizes])
    if @contest.save
      redirect_to @contest
    else
      flash[:notice] = "No good muthafucka"
    end
  end

  def index
    if current_user.bartender
      @contests = current_user.contests


    else
      @contests = Contest.all
    end
  end


  def show
    @contest = Contest.find(params[:id])
  end

  def edit
    @contest = Contest.find(params[:id])

  end

  def update
    @contest = Contest.find(params[:id])
    if @contest.prizes.empty?
      @contest.prizes.create(params[:prizes])
    elsif @contest.update_attributes(params[:contest])
      redirect_to @contest
    else
      redirect_to contests_path
    end
  end

  def destroy
    @contest = Contest.find(params[:id])
    if @contest.destroy
      redirect_to contests_path
    else
      flash[:notice] = "Error"
      redirect_to :back
    end
  end

end