class DriversController < ApplicationController
  def index
  end

  def new
    @driver = Driver.new
  end
end
