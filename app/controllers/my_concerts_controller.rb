class MyConcertsController < ApplicationController
  def show
  end

  def index
    @band = Band.where(user_id: current_user.id)
    @participations = Participation.where(concert: @concert)
    @concerts = Concert.where(band: @band)
    @past_concerts = @concerts.where('start_time <= ?', 1.hour.ago)
    @future_concerts = @concerts.where('start_time >= ?', DateTime.now)
  end

  def new
    if params[:address].present?
      @concert = Concert.new(address: params[:address])
    else
      @concert = Concert.new()
    end
    @user = current_user
  end

  def create
    @band = current_user.band
    @concert = Concert.new(my_concert_params)
    @concert.price_cents = @concert.price_cents * 100
    @concert.confirmed = true
    @concert.band = @band
    if @concert.save
      redirect_to concert_path(@concert)
    else
      @user = current_user
      flash[:alert] = "#{@concert.errors.messages[:base][0]}" unless @concert.errors.messages[:base][0].nil?
      render :new
    end
  end

  private

  def my_concert_params
    params.require(:concert).permit(:photo, :title, :address, :description, :external_link, :price_cents, :start_time, :confirmed)
  end
end
