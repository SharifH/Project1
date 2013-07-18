class PrizesController < ApplicationController

  def new
    @prize = Prize.new
  end

  def create
    @prize = Prize.new(params[:prize])
    if @prize.save
      redirect_to prizes_path
    else
      render 'new'
    end
  end

  def index
    @prizes = Prize.all
  end

  def show
    @prize = Prize.find(params[:id])
  end

  def edit
    @prize = Prize.find(params[:id])
  end

  def update
    @prize = Prize.find(params[:id])
    if @prize.update_attributes(params[:prize])
      redirect_to prizes_path
    else
      flash[:notice] = "error on updating"
      render edit_prize_path
    end
  end

end
