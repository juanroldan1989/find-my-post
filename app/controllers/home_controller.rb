class HomeController < ApplicationController
  layout :set_layout

  before_filter :set_graph,   only: :results
  before_filter :set_session, only: :index

  helper_method :feed_results
  helper_method :group_data
  helper_method :groups

  def index
  end

  def results
  end

  private

  def groups
    @groups ||= @user_graph.groups
  end

  def group_data
    @group_data ||= GroupData.new(@user_graph, params).call
  end

  def feed_results
    @feed_results ||= FeedPresenter.new(group_data).call
  end

  def set_graph
    if params[:code].present?
      session[:access_token] = session[:oauth].get_token(params)
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
