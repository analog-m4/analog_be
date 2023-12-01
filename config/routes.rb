Rails.application.routes.draw do

resources :fake_route
#checking to see if CI works, delete if you see this
namespace :api do
  namespace :v1 do
    resources :users do
    end
  end
end

end
