class SearchController < ApplicationController
  def index
  	if params[:q].present?
  		render plain: params[:q].inspect
  	else
  	end
  end
end
