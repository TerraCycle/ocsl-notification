Rails.application.routes.draw do
  root 'ocsls#index'

  get 'requests/(:token)', to: 'ocsls#requests'

  namespace :api do
    namespace :v1 do
      resource :ocsl_notifications, only: [:create]
      post '/ocsl_notification_basic_auth' => 'ocsl_notifications#ocsl_notification_basic_auth'
    end
  end
end
