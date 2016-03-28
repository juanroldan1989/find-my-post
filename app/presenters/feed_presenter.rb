class FeedPresenter < Struct.new(:group_data)

  def call
    sanitized_group_data.collect do |item|
      PostPresenter.new(item).call
    end
  end

  private

  def sanitized_group_data
    if group_data.present? && group_data["feed"].present? && group_data["feed"]["data"].present?
      group_data["feed"]["data"]
    else
      []
    end
  end

end
