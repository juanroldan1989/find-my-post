require "rails_helper"

RSpec.describe HomeHelper do
  # 'helper' is an instance of ActionView::Base configured with the
  # EventsHelper and all of Rails' built-in helpers

  describe "#posts_amount" do
    it "displays all possible amounts of posts to retrieve" do
      content = [
        ["20 posts", 20], ["40 posts", 40], ["60 posts", 60],
        ["80 posts", 80], ["120 posts", 120], ["180 posts", 180],
        ["250 posts", 250]
      ]

      expect(helper.posts_amount).to eq content
    end
  end
end
