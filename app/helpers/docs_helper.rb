require 'navigation'
require 'complex_page'

module DocsHelper

  def display_menu
    html = ''
    Navigation.tree(params[:version]).each do |section, items|
      html += content_tag(:h3, link_to(section, '#'), class: 'accordion') + content_tag(:ul, submenu(items), class: 'pages')
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

  def submenu(items)
    items.inject('') do |h, (permalink, title)|
      if title.is_a?(Hash)
        h += content_tag(:li, content_tag(:h4, permalink) + content_tag(:ul, submenu(title)))
      else
        h += li_with_page_link(permalink, title)
      end
    end.html_safe
  end

  def li_with_page_link(page, title)
    content_tag :li, class: (page == params[:page] ? 'active' : nil) do
      link_to(title, "#{params[:version] != 'stable' ? "/#{params[:version]}" : ''}/#{page}")
    end
  end

  def jsfiddle_embed(token, options = {})
    options = { height: 300, panes: 'result,html' }.merge(options)

    "<iframe style='width: 100%; height: #{options[:height]}px' src='http://jsfiddle.net/sublimevideo/#{token}/embedded/#{options[:panes]}' allowfullscreen webkitallowfullscreen mozallowfullscreen frameborder='0'></iframe>"
  end

end
