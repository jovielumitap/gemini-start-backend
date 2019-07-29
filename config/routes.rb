Rails.application.routes.draw do
  mount_devise_token_auth_for 'User', at: '/api/v1/users', controllers: {
      registrations:  'api/v1/registrations',
      sessions:  'api/v1/sessions',
      passwords:  'api/v1/passwords'
  }
  namespace :api do
    namespace :v1, defaults: { format: :json } do
      devise_scope :user do
        get :status, to: 'api#status'
        resources :users, only: [:index, :show]
        resource :user, only: :create
        resources :categories

        get :test_mail, to: 'testapis#send_mail'
      end
    end
  end

  mount ActionCable.server => '/cable'
end
