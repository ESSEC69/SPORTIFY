class SportsController < ApplicationController

  before_action :set_sport, only: [ :show]

  def new
    @sport = Sport.new
  end

  def create
    @sport = Sport.new(sport_params)

    @sport.save
    @sports = Sport.all
    render :index

  end

  def index
    @sports = Sport.all

  end

  def show
    @trials = Trial.where(sport_id: @sport)

  end

  private

  def sport_params
    params.require(:sport).permit(:name, :description)
  end

  def set_sport
    if Sport.all.exists?
    @sport = Sport.find(params[:id])
    else
    @sport = "no sport available"
    end
  end

end
