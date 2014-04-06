class Admin::EventsController < ApplicationController
  inherit_resources

private
  def permitted_params
    params.permit!
  end 
end