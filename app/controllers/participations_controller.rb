class ParticipationsController < ApplicationController

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
