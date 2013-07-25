module ApplicationHelper

  def navigation_list_item(text, path, link_options = {})
    list_item_options = {}

    if current_page?(path)
      list_item_options[:class] = "active"
    end

    content_tag :li, list_item_options do
      link_to text, path, link_options
    end

  end

end
