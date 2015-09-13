# Maps environment variables into configuration settings

# App
Rails.application.config.host                = Figaro.env.host

# Facebook IDs
Rails.application.config.facebook_app_id     = Figaro.env.facebook_app_id
Rails.application.config.facebook_app_secret = Figaro.env.facebook_app_secret
