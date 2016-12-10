class HomeController < ApplicationController
  def index
  	@a = 0

    #@packages = Package.paginate(page: params[:page], per_page: 2).order('created_at DESC')

    #@packages = Package.paginate(:page => params[:page], :per_page => 3)



  	@agencies = Agency.all

    
    @prices = Package.select(:price).distinct

    @durations = Package.select(:duration).distinct

=begin
    if params[:agency_id]
    	@packages = Package.where(agency_id: params[:agency_id])
    elsif params[:price]
    	@packages = Package.where(price: params[:price])
    elsif params[:duration]
    	@packages = Package.where(duration: params[:duration])
    else
    	@packages = Package.all
    end    
=end

    @selected_agencies = (params[:agency_ids].present? ? params[:agency_ids] : [])
    @selected_prices = (params[:price_ids].present? ? params[:price_ids] : [])
    @selected_durations = (params[:duration_ids].present? ? params[:duration_ids] : [])

    @packages = Package.all 


    if params[:agency_ids]
      @packages = Package.where("agency_id IN (?)", params[:agency_ids])
    end

    if params[:price_ids]
      @packages = Package.where("price IN (?)", params[:price_ids])
    end

    if params[:duration_ids]
      @packages = Package.where("duration IN (?)", params[:duration_ids])
    end

    if params[:agency_ids] && params[:price_ids]
      @packages = Package.where("agency_id IN (?) AND price IN (?)", params[:agency_ids], params[:price_ids])
    end

    if params[:price_ids] && params[:duration_ids]
      @packages = Package.where("price IN (?) AND duration IN (?)", params[:price_ids], params[:duration_ids])  
    end

    if params[:agency_ids] && params[:duration_ids]
      @packages = Package.where("agency_id IN (?) AND duration IN (?)", params[:agency_ids], params[:duration_ids])
    end
    
    if params[:agency_ids] && params[:price_ids] && params[:duration_ids]
      @packages = Package.where("agency_id IN (?) AND price IN (?) AND duration IN (?)", params[:agency_ids], params[:price_ids] ,params[:duration_ids])                     
    end
#binding.pry

    @packages = @packages.paginate(:page => params[:page], :per_page => 3)


  end
end
