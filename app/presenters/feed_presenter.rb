class FeedPresenter < Struct.new(:group_data)

  def results
    list = []

    group_data.each do |item|
      if item[1]["data"].present?
        item[1]["data"].each do |feed_item|
          list.push(setup_feed_item(feed_item))
        end
      end
    end

    list.compact
  end

  private

  def setup_feed_item(item)
    PostPresenter.new(item).call
  end
end
