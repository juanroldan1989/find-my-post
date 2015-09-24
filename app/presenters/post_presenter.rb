class PostPresenter

  attr_reader :feed_item

  def initialize(feed_item)
    @feed_item = feed_item
  end

  def setup
    {
      id:           feed_item["id"],
      from_id:      feed_item["from"]["id"],
      from_name:    feed_item["from"]["name"],
      name:         feed_item["name"],
      message:      feed_item["message"],
      updated_at:   feed_item["updated_time"]
    }
  end
end
