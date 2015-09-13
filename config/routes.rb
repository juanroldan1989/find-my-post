FindMyPost::Application.routes.draw do
  get "/results" => "home#results"
  root :to       => "home#index"
end
