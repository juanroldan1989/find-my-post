require "koala"

class SetupOauth

  def initialize
    @oauth = Koala::Facebook::OAuth.new(app_id, app_secret, callback_url)
  end

  def get_token(params)
    @oauth.get_access_token(params[:code])
  end

  def oauth_url
    # API upgrade to v2.5 allows access only to groups managed by the User
    @oauth_url ||= @oauth.url_for_oauth_code(permissions: "user_managed_groups")
  end

  private

  def app_id
    Rails.application.config.facebook_app_id
  end

  def app_secret
    Rails.application.config.facebook_app_secret
  end

  def callback_url
    callback_url = "#{Rails.application.config.domain}/results"
  end
end
