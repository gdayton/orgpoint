class StatsController < ApplicationController
  def index
	  @company = Company.find(params[:id])
  end
end
