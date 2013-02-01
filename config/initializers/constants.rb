APP_ID     = '250798808383711' # please change!
APP_SECRET = '215bab18880861c6292cfedd12f54f56' # please change!

if Rails.env.production?
  SITE_URL   = 'http://organizeme.herokuapp.com'
else
  SITE_URL   = 'http://localhost:3000'
end
