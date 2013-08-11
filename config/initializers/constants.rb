if Rails.env.production?
  SITE_URL   = 'http://encuentramipost.herokuapp.com'
	APP_ID     = '250798808383711' # please change!
	APP_SECRET = '215bab18880861c6292cfedd12f54f56' # please change!
else
  SITE_URL   = 'http://localhost:3000'
  APP_ID     = '430107757064130'
  APP_SECRET = 'df2a630d68cf599b0965e990ebbd7fc6'
end
