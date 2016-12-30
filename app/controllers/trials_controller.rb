class TrialsController < ApplicationController
  before_action :set_trial, only: [ :show]

  def new
    @trial = Trial.new
  end

  def create
    @trial = Trial.new(trial_params)

    @trial.save
    @trials = Trial.all
    render :index

  end

  def index
    @trials = Trial.all

  end

  def show
    @events = Event.where(trial_id: @trial)

  end

  private

  def trial_params
    params.require(:trial).permit(:name, :description)
  end

  def set_trial
    @trial = Trial.find(params[:id])
  end

end
