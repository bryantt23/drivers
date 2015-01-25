class DriversController < ApplicationController
  def index
    @drivers = Driver.all 
  end

  def new
    @driver = Driver.new
  end
    
  def create
#     prints out parameters to the screen
#   can see hash & key
    # render text: params.inspect
    # do this to know which params to require below

    @driver = Driver.new(    driver_params    )
    
    if @driver.save
      redirect_to drivers_url
    else
      render 'new'
    end
  end

# to DRY
def driver_params
    params.require(:driver).permit(:first_name, :last_name)  
end


end
