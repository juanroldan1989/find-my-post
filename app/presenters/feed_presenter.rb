class FeedPresenter

  attr_reader :group_data

  def initialize(group_data)
    @group_data = group_data
  end

  def data
    {
      id:   group_data["id"],
      name: group_data["name"],
      icon: group_data["icon"]
    }
  end

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
    PostPresenter.new(item).setup
  end
end
