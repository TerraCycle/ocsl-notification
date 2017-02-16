class OcslsController < ApplicationController
  def requests
    @token = params[:token]

    @requests = Request.where(token: @token).order(created_at: :desc).limit(10)
  end
end
