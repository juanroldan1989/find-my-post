class GroupPosts

  attr_reader :counter
  attr_reader :group
  attr_reader :user_graph

  def initialize(user_graph, params)
    @counter    = params[:posts_cant]
    @group      = params[:group]
    @user_graph = user_graph
  end

  def results
    if group.present?
      user_graph.api.get_object("/#{group}", "fields" => fields)
    else
      []
    end
  end

  private

  def fields
    "name,description,icon,feed.fields(from,message,name).limit(#{posts_counter})"
  end

  def posts_counter
    @posts_counter ||= counter.present? ? counter : 20
  end
end
