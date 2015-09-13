class UserGraph

  def initialize(access_token)
    @api = Koala::Facebook::API.new(access_token)
  end

  def profile
    @api.get_object("me")
  end

  def picture
    @api.get_picture("me")
  end

  def groups
    @groups ||= @api.fql_query(query)
  end

  def posts_by_group(params)
    @posts ||= if params[:group].present?
      @api.get_object("/#{params[:group]}", "fields" => fields(params))
    else
      []
    end
  end

  private

  def fields(params)
    "name,description,icon,feed.fields(from,message,name).limit(#{posts_counter(params)})"
  end

  def query
    "SELECT gid, name FROM group WHERE gid IN (SELECT gid FROM group_member WHERE uid = me()) ORDER BY name"
  end

  def posts_counter(params)
    @posts_counter ||= params[:posts_cant].present? ? params[:posts_cant] : 20
  end
end
