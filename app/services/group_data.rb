class GroupData

  attr_reader :counter
  attr_reader :group
  attr_reader :user_graph

  def initialize(user_graph, params)
    @counter    = params[:posts_cant]
    @group      = params[:group]
    @user_graph = user_graph
  end

  def call
    group.present? ? set_group_graph : []
  end

  private

  def fields
    "name,description,icon,feed.fields(from,message,name).limit(#{posts_counter})"
  end

  def posts_counter
    @posts_counter ||= counter.present? ? counter : 20
  end

  def set_group_graph
    user_graph.api.get_object("/#{group}", "fields" => fields)
  end
end
