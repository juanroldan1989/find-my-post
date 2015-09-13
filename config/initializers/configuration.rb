# Maps environment variables into configuration settings

# App
Rails.application.config.domain              = Figaro.env.domain

# Facebook IDs
Rails.application.config.facebook_app_id     = Figaro.env.facebook_app_id
Rails.application.config.facebook_app_secret = Figaro.env.facebook_app_secret
