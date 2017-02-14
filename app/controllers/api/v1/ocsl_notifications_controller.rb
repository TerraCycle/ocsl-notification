module Api
  module V1
    class OcslNotificationsController < ApplicationController
      skip_before_action :verify_authenticity_token

      # POST
      def create
        render json: { status: 200, data: params.symbolize_keys[:data], message: nil }
      end
    end
  end
end
