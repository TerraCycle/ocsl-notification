Rails.application.routes.draw do
  root 'ocsls#index'

  namespace :api do
    namespace :v1 do
      resource :ocsl_notifications, only: [:create]
    end
  end
end
