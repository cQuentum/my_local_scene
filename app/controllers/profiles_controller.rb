class ProfilesController < ApplicationController
  def show
    if current_user.id == params[:id].to_i
    @user = current_user
    else
    redirect_to root_path
    end
  end

  def edit
    redirect_to root_path if current_user.id != params[:id].to_i
    @user = current_user
  end

  def update
    user_to_update = User.find(params[:id])
    params[:user][:genres]
    user_to_update.update(update_params)
    redirect_to profile_path(user_to_update)
  end

private
  def update_params
    params.require(:user).permit(:location, :move_radius, genres: [])
  end
end
