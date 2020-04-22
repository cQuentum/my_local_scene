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
      redirect_to concert_path(@participation.concert), notice: "Merci, votre participation a bien été prise en compte."
    else
      render concert_path(@participation.concert)
    end
  end

  def destroy
    @concert = Concert.find(params[:concert_id])
    @participation_concert = @concert.participations.where(user_id: current_user.id)
    @participation_concert[0].destroy
    redirect_to concert_path(@concert), notice: "L'annulation a bien été prise en compte."
  end
end
