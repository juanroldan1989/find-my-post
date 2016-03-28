class HomeController < ApplicationController
  layout :set_layout

  before_filter :set_graph,   only: :results
  before_filter :set_session, only: :index

  helper_method :feed_items
  helper_method :group_data
  helper_method :groups

  def index
  end

  def results
    if request.xhr?
      render partial: "feed"
    end
  end

  private

  def groups
    @groups ||= @user_graph.groups
  end

  def group_data
    @group_data ||= GroupData.new(@user_graph, params).call
  end

  def feed_items
    @feed_items ||= FeedPresenter.new(group_data).call
  end

  def set_graph
    if params[:code].present?
      session[:access_token] = SetupOauth.new.get_token(params)
    end

    @user_graph = UserGraph.new(session[:access_token])
  end

  def set_session
    session[:oauth] = SetupOauth.new

    @auth_url       = session[:oauth].oauth_url
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
