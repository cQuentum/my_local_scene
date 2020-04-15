class ConcertsController < ApplicationController
  def index
  end

  def show
  end

  def new
  end

  def create
  end


  private

  def concert_params
    params.require(:nation).permit(:capital_name, :price_per_day, :name, :description, :photo)
  end
end
