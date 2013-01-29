OrganizeME::Application.routes.draw do
  root :to => 'home#index'
  match '/results' => 'home#results'
end
