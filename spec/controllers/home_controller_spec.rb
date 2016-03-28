require "rails_helper"

RSpec.describe HomeController do
  describe "GET #index" do
    it "responds successfully with an HTTP 200 status code" do
      get :index
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end

    it "renders the index template" do
      get :index
      expect(response).to render_template("index")
    end
  end

  describe "GET #results" do
    it "responds successfully with an HTTP 200 status code" do
      get :results
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end

    it "renders the 'feed' partial for ajax request" do
      xhr :get, :results
      expect(response).to render_template("home/_feed")
    end

    it "renders the results template for regular request" do
      get :results
      expect(response).to render_template("home/results")
    end

    it "loads all posts retrieved from Facebook's group into @feed_items" do
      returned_post_1 = {
        "id" => 111, "from" => { "id" => 123, "name" => "Batman" },
        "name" => "Secondary content for the post", "message" => "Do you bleed ?...you will"
      }

      returned_post_2 = {
        "id" => 222, "from" => { "id" => 321, "name" => "Superman" },
        "name" => "Secondary content for the post", "message" => "Stay down!"
      }

      # stubbing method filled with data from Facebook's API response
      allow(controller).to receive(:group_data).and_return(
        {
          "feed" => { "data" => [ returned_post_1, returned_post_2 ] }
        }
      )

      get :results

      post_1 = PostPresenter.new(returned_post_1).call
      post_2 = PostPresenter.new(returned_post_2).call

      expect(subject.send(:feed_items)).to eq [post_1, post_2]
    end
  end
end
