module Api
  module V1
    class OcslNotificationsController < ApplicationController

      # POST
      def create
        render json: { status: 200, data: params[:data][:attributes], message: nil }
      end
    end
  end
end
