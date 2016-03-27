source "https://rubygems.org"

ruby                          "2.1.6"

gem "rails",                  "~> 4.1"
gem "figaro",                 "~> 1.1.1"
gem "jquery-rails",           "~> 3.1.4"
gem "koala",                  "~> 2.2.0"

group :assets do
  gem "sass-rails",           "~> 5.0.4"
  gem "coffee-rails",         "~> 4.1.0"
  gem "uglifier",             "~> 2.7.2"
end

group :test, :development do
  gem "foreman",              "~> 0.78.0"
  gem "rails_best_practices", "~> 1.15.7"
end

group :production do
  gem "pg",                   "~> 0.18.3"
  gem "rails_12factor",       "~> 0.0.3"
  gem "unicorn",              "~> 4.9.0"
end
