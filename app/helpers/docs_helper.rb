module DocsHelper

  def li_with_page_link(page, options = {}, &block)
    title = page.split('/').last.gsub('-', ' ').humanize
    content_tag :li, class: (page == params[:page] ? "active" : nil) do
      link_to(options[:title] || title, "/#{page}") + (block_given? ? capture_haml { yield } : '')
    end
  end

  # lame hack until sublimevideo_layout 0.6.6 is released...
  def sublimevideo_include_tag(ssl_request, name)
    %(<script src="#{ssl_request ? "https://4076.voxcdn.com" : "http://cdn.sublimevideo.net"}/js/#{::SiteToken[name.to_sym]}.js" type="text/javascript"></script>)
  end

end
