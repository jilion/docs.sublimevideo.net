module DocsHelper

  def li_with_page_link(page, options = {}, &block)
    title = page.split('/').last.gsub('-', ' ').humanize
    content_tag :li, class: (page == params[:page] ? "active" : nil) do
      link_to(options[:title] || title, "/#{page}") + (block_given? ? capture_haml { yield } : '')
    end
  end

end
