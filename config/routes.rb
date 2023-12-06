Rails.application.routes.draw do

resources :fake_route
#checking to see if CI works, delete if you see this
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
