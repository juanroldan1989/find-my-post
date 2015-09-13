class HomeController < ApplicationController
  layout :set_layout

  before_filter :set_graph,   only: :results
  before_filter :set_session, only: :index

  helper_method :groups
  helper_method :posts

  def index
  end

  def results
    @fbprofile  = @user_graph.profile
    @fbp_image  = @user_graph.picture
  end

  private

  def groups
    @groups ||= @user_graph.groups
  end

  def posts
    @posts ||= @user_graph.posts_by_group(params)
  end

  def setup_oauth
    @setup_oauth ||= SetupOauth.new
  end

  def set_graph
    if params[:code].present?
      session[:access_token] = session[:oauth].get_token(params)
    end

    @user_graph = UserGraph.new(session[:access_token])
  end

  def set_session
    session[:oauth] = setup_oauth

    @auth_url       = setup_oauth.oauth_url
  end

  def set_layout
    case action_name
    when "results"
      "results"
    else
      "application"
    end
  end
end
