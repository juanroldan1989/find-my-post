class HomeController < ApplicationController
  def index
   	session[:oauth] = Koala::Facebook::OAuth.new(APP_ID, APP_SECRET, SITE_URL + '/results')
		@auth_url =  session[:oauth].url_for_oauth_code(:permissions => "user_groups") 	
  	
  	respond_to do |format|
			 format.html { }
		 end
  end

  def results
	 	if params[:code]
		  session[:access_token] = session[:oauth].get_access_token(params[:code])
		end		

		# auth established, now do a graph call:
		# @api = Koala::Facebook::API.new('AAACEdEose0cBAHtZC0NT37xfOfbP1keDQmeT46JyPFZC3lnDnDqZBRJfb8y41U12vSfH7hNT1ZBdYZBCO86jMDDf95FZCkZADKJtW8clSbbBgZDZD')
		@api = Koala::Facebook::API.new(session[:access_token])

		begin
			#consultas personales
			@fbprofile  = @api.get_object("me")
			@fbp_image  = @api.get_picture("me")
			@fbp_groups = @api.get_object("me/groups")

			fql          = "SELECT gid, name FROM group WHERE gid IN (SELECT gid FROM group_member WHERE uid = me()) ORDER BY name"
			@user_groups = @api.fql_query(fql)

			#selecciono un grupo del dropdown
			if params[:group]
				#consultar grupo por su ID, no desde mi face: /me/groups/...
				@graph_group_data    = @api.get_object("/" + params[:group], "fields" => "name,description,icon,feed.fields(from,message).limit(" + params[:posts_cant] + ")")
			end

		rescue Exception=>ex
			puts ex.message
		end
  
 		respond_to do |format|
		 format.html {   }
		end
  end

end
