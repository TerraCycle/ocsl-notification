class OcslsController < ApplicationController
  def requests
    @token = params[:token]

    @requests = Request.where(token: @token)
  end
end
