module DocsHelper

  def li_with_page_link(page, options = {}, &block)
    content_tag :li, class: (page == params[:page] ? "active" : nil) do
      link_to(Navigation.menu_title(page), "/#{page}") + (block_given? ? capture_haml { yield } : '')
    end
  end

end
