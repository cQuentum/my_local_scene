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
    params.require(:concert).permit(:title, :address, :description, :external_link, :price_cents, :confirmed, :start_time, :end_time, :latitude, :longitude)
  end
end
