class OcslNotificationsController < ApplicationController

  # POST method
  def create
    render json: { status: 200, data: params[:json] }
  end
end
