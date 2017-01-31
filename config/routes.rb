Rails.application.routes.draw do
  root 'ocsls#index'

  resource :ocsl_notifications, only: [:create]
end
