class ParticipationsController < ApplicationController
  def index
    @participation = Participation.where(user_id: current_user.id)
    @concerts = Concert.where(participations: @participation).reverse
  end

  def create
    @participation = Participation.new
    @participation.user = current_user
    @participation.concert = Concert.find(params[:concert_id])
    if @participation.save
      redirect_to concert_path(@participation.concert)
    else
      render concert_path(@participation.concert)
    end
  end
end
