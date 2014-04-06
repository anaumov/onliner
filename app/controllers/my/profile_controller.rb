class My::ProfileController < ApplicationController

  def index
    @user = current_user
  end
end