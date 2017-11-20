require 'base64'
require 'jwt'

module Api
  module V1
    class OcslNotificationsController < ApplicationController
      skip_before_action :verify_authenticity_token
      http_basic_authenticate_with name: 'test', password: 'auth', only: [:ocsl_notification_basic_auth]
      before_action :create_request

      def create
        render json: { status: 200, data: @data[:attributes], message: nil }
      end

      def ocsl_notification_basic_auth
        render json: { status: 200, data: @data[:attributes], message: 'BASIC AUTH' }
      end

      private

      def create_request
        orig_params = params.symbolize_keys[:data]
        if orig_params['token'].nil?
          @data = orig_params.merge(token: 'test').symbolize_keys
        else
          @data = JSON.parse(params.symbolize_keys[:data], symbolize_names: true)
        end
        begin
          @data[:attributes]['client_data'] =
            JWT.decode(orig_params['attributes']['optional_params'], nil, false).first
        rescue Exception => e
        end
        Request.create!(token: @data[:token], body: @data[:attributes])
      end
    end
  end
end
