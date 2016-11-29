class HomeController < ApplicationController
  def index
  	$a = 0
  	@agencies = Agency.all
    @packages = Package.all  	
  end
end
