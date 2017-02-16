Rails.application.routes.draw do
  root 'ocsls#index'

  get 'requests/(:uuid)', to: 'ocsls#requests'

  namespace :api do
    namespace :v1 do
      resource :ocsl_notifications, only: [:create]
    end
  end
end
