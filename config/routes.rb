Rails.application.routes.draw do
  get "/results" => "home#results", as: :search
  root :to       => "home#index"
end
