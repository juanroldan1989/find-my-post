class HomeController < ApplicationController
  layout :set_layout

  before_filter :set_session,      only: :index
  before_filter :set_access_token, only: :results

  def index
  end

  def results
    # auth established, now do a graph call:
    # @api = Koala::Facebook::API.new('AAACEdEose0cBAHtZC0NT37xfOfbP1keDQmeT46JyPFZC3lnDnDqZBRJfb8y41U12vSfH7hNT1ZBdYZBCO86jMDDf95FZCkZADKJtW8clSbbBgZDZD')
    @api = Koala::Facebook::API.new(session[:access_token])

    begin
      #consultas personales
      @fbprofile  = @api.get_object("me")
      @fbp_image  = @api.get_picture("me")

      fql          = "SELECT gid, name FROM group WHERE gid IN (SELECT gid FROM group_member WHERE uid = me()) ORDER BY name"
      @user_groups = @api.fql_query(fql)

      #selecciono un grupo del dropdown
      if params[:group]
        #consultar grupo por su ID, no desde mi face: /me/groups/...
        @graph_group_data    = @api.get_object("/" + params[:group], "fields" => "name,description,icon,feed.fields(from,message,name).limit(" + params[:posts_cant] + ")")
      end

    rescue Exception=>ex
      puts ex.message
    end
  
    respond_to do |format|
     format.html { }
    end
  end

  private

  def setup_oauth
    @setup_oauth ||= SetupOauth.new
  end

  def set_access_token
    if params[:code].present?
      session[:access_token] = session[:oauth].get_token(params)
    end
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
