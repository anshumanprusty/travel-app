class HomeController < ApplicationController
  def index
  	$a = 0
  	@agencies = Agency.all
    
    @prices = Package.select(:price).distinct

    @durations = Package.select(:duration).distinct

    if params[:agency_id]
    	@packages = Package.where(agency_id: params[:agency_id])
    elsif params[:price]
    	@packages = Package.where(price: params[:price])
    elsif params[:duration]
    	@packages = Package.where(duration: params[:duration])
    else
    	@packages = Package.all
    end    

  end
end
