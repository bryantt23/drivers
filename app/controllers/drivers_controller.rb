class DriversController < ApplicationController
  def index
    @drivers = Driver.all 
  end

#   @driver.build_license b/c these text fields & labels disappeared
  def new
    @driver = Driver.new
    @driver.build_license
  end
  
  
  
    
  def create
#     prints out parameters to the screen
#   can see hash & key
    # render text: params.inspect
    # do this to know which params to require below

    @driver = Driver.new(driver_params)
    
    if @driver.save
      redirect_to drivers_url
    else
      render 'new' 
    end
  end
  
  def destroy
    @driver = Driver.find(params[:id])
    @driver.destroy
    redirect_to drivers_url
  end

private 

# to DRY
def driver_params
    params.require(:driver).permit(:first_name, :last_name,
    license_attributes: [:number, :state]
#     above fails, so need to create method to give parameters to, in driver.rb
    )  
end


end
