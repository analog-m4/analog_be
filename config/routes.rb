Rails.application.routes.draw do
mount ActionCable.server => '/cable'
namespace :api do
  namespace :v1 do
    resources :users do
      get 'dashboard', on: :member
      resources :projects do
        resources :tasks
      end
    end
  end
end

end
