module HomeHelper

  def groups_to_select_from
    groups.collect {|s| [s["name"], s["gid"]]}
  end

  def posts_amount
    [
      ["20 posts", 20], ["40 posts", 40], ["60 posts", 60],
      ["80 posts", 80], ["120 posts", 120], ["180 posts", 180],
      ["250 posts", 250]
    ]
  end
end
