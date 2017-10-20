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

    context "with valid access_token" do
      let!(:set_token) do
        session[:access_token] = 'EAACEdEose0cBAEKVkvt3BYb1vEDeZBBt7kzDbILJuUoFeiAIop0k6GX32SVHkGbjm5OB8k0iCHxSopW78ygtlluO78lOyAHtfFd8723xmfu0xXWlhY6ojy5OU597EgsiNOU6ZCCifpORPiZBNFBIuvSPCAW42toMmRcqj5tEq3rDbGNWDcAyZC2XPrF74nUZD'
      end

      let(:feed_item) {
        {
          id:        "304163172988441_1075438062527611",
          from_id:   "562013635",
          from_name: "Juan Roldán",
          name:       nil,
          message:    "vengo a dejar esto por aqui\n\nhttps://www.facebook.com/kirstin.walters",
          updated_at: nil
        }
      }

      it "should add posts into @feed_items" do
        VCR.use_cassette("feed_items_valid_access_token") do
          get :results, group: "304163172988441"

          expect(subject.send(:feed_items).last).to eq feed_item
        end
      end
    end

    context "with invalid access_token" do
      let!(:set_token) do
        session[:access_token] = 'invalid_access_token'
      end

      it "should not add any posts into @feed_items" do
        VCR.use_cassette("feed_items_invalid_access_token") do
          get :results, group: "304163172988441"

          expect(subject.send(:feed_items)).to eq []
        end
      end
    end

    context "with invalid group_id" do
      let!(:set_token) do
        session[:access_token] = 'EAACEdEose0cBAEKVkvt3BYb1vEDeZBBt7kzDbILJuUoFeiAIop0k6GX32SVHkGbjm5OB8k0iCHxSopW78ygtlluO78lOyAHtfFd8723xmfu0xXWlhY6ojy5OU597EgsiNOU6ZCCifpORPiZBNFBIuvSPCAW42toMmRcqj5tEq3rDbGNWDcAyZC2XPrF74nUZD'
      end

      it "should not add any posts into @feed_items" do
        VCR.use_cassette("feed_items_invalid_group_id") do
          get :results, group: '11111'

          expect(subject.send(:feed_items)).to eq []
        end
      end
    end

    context "without group_id" do
      let!(:set_token) do
        session[:access_token] = 'EAACEdEose0cBAEKVkvt3BYb1vEDeZBBt7kzDbILJuUoFeiAIop0k6GX32SVHkGbjm5OB8k0iCHxSopW78ygtlluO78lOyAHtfFd8723xmfu0xXWlhY6ojy5OU597EgsiNOU6ZCCifpORPiZBNFBIuvSPCAW42toMmRcqj5tEq3rDbGNWDcAyZC2XPrF74nUZD'
      end

      it "should not add any posts into @feed_items" do
        get :results

        expect(subject.send(:feed_items)).to eq []
      end
    end
  end
end
