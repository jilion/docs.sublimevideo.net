require 'navigation'

module DocsHelper

  def display_menu
    html = ''
    Navigation.tree(params[:version]).each do |section, items|
      html += content_tag :ul do
        content_tag :li do
          content_tag :ul, class: 'pages' do
            content_tag :li, class: 'title' do
              content_tag(:h3, section) +
              items.inject('') do |h, (permalink, title)|
                h += li_with_page_link(permalink, title)
              end.html_safe
            end
          end
        end
      end
    end
    raw html
  end

  def li_with_page_link(page, title)
    content_tag :li, class: (page == params[:page] ? 'active' : nil) do
      link_to(title, "#{params[:version] != 'stable' ? "/#{params[:version]}" : ''}/#{page}")
    end
  end

end
