class My::ProfileController < ApplicationController
  before_action :authenticate_user!

  def index
    @user = current_user
  end

  def edit
    @user = current_user
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