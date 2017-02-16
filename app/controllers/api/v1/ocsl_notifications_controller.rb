module Api
  module V1
    class OcslNotificationsController < ApplicationController
      skip_before_action :verify_authenticity_token

      # POST
      def create
        orig_params = params.symbolize_keys[:data]
        if orig_params['token'].nil?
          data = orig_params.merge(token: 'test').symbolize_keys
        else
          data = JSON.parse(params.symbolize_keys[:data], symbolize_names: true)
        end
        Request.create!(token: data[:token], body: data[:attributes])

        render json: { status: 200, data: data[:attributes], message: nil }
      end
    end
  end
end
