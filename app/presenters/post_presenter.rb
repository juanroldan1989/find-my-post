class PostPresenter < Struct.new(:feed_item)

  def call
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
