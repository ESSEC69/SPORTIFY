class PagesController < ApplicationController
  def home
  end

  def recherche

    @sports = Sport.all
    @trials = Trial.all
    @master_events = MasterEvent.all
  end


    private

end
