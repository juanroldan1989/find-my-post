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
    @groups ||= api.fql_query(query)
  end

  private

  def query
    "SELECT gid, name FROM group WHERE gid IN (SELECT gid FROM group_member WHERE uid = me()) ORDER BY name"
  end
end
