class ProfileController < ApplicationController

  def index
  end

  def edit
    if current_user.username == params[:username]
      @user = current_user
    else
      redirect_to profile_path
    end
  end

  def update
    @user = User.find current_user.id

    if @user.update_attributes(permitted_params[:user])
      redirect_to profile_path, notice: "Ваш профиль обновлен!"
    else
      render :edit
    end
  end

private
  def permitted_params
    params.permit!
  end
end