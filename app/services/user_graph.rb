class UserGraph

  attr_reader :api

  def initialize(access_token)
    @api = Koala::Facebook::API.new(access_token)
  end

  def profile
    @profile ||= api.get_object("me")
  end

  def picture
    @picture ||= api.get_picture("me")
  end

  def groups
    @groups ||= api.get_connections("me", "groups")
  end
end
