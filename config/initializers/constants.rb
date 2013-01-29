APP_ID     = '250798808383711' # please change!
APP_SECRET = '15df202b82dadc7071145d75d58dc6d5' # please change!

if Rails.env.production?
  SITE_URL   = 'http://organizeme.herokuapp.com'
else
  SITE_URL   = 'http://localhost:3000'
end

