require 'navigation'
require 'complex_page'

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

  def display_complex_page_index(page)
    html = ''
    ComplexPage.tree(page).each do |permalink, title|
      html += content_tag(:li, link_to(title.html_safe, "##{permalink}"))
    end
    raw content_tag :ul, html.html_safe
  end

  def display_complex_page_list(page)
    html = ''
    ComplexPage.tree(page).each do |permalink, title|
      html += content_tag(:h3, link_to(title.html_safe, "##{permalink}", id: permalink))
      html += render "pages/#{params[:version]}/#{page}/#{permalink}"
    end
    raw html.html_safe
  end

  def li_with_page_link(page, title)
    content_tag :li, class: (page == params[:page] ? 'active' : nil) do
      link_to(title, "#{params[:version] != 'stable' ? "/#{params[:version]}" : ''}/#{page}")
    end
  end

end
