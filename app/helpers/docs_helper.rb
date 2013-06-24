require 'navigation'
require 'complex_page'

module DocsHelper

  def title(title)
    @page_title = title
  end

  def display_menu
    html = ''
    Navigation.tree.each do |section, items|
      html += content_tag(:h3, section) + content_tag(:ul, submenu(items), class: ['pages'])
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
    html = []
    ComplexPage.tree(page).each do |permalink, title|
      html << content_tag(:h3, link_to(title.html_safe, "##{permalink}", id: permalink))
      html << "\n\n#{File.new(Rails.root.join(page_realpath([page, permalink], partial: true))).read}"
    end

    render_erb(html.join(''))
  end

  def section_and_page_title_from_permalink(permalink)
    if section = Navigation.section_from_permalink(permalink)
      "#{section[0]}: " + (section.size == 2 ? "#{section[1]} > " : '') + Navigation.page_title_from_permalink(permalink)
    else
      ''
    end
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
      link_to(title, "/#{page}")
    end
  end

  def jsfiddle_embed(token, options = {})
    options.reverse_merge!(height: 300, panes: 'result,html')

    "<iframe style='width: 100%; height: #{options[:height]}px' src='//jsfiddle.net/sublimevideo/#{token}/embedded/#{options[:panes]}' allowfullscreen webkitallowfullscreen mozallowfullscreen frameborder='0'></iframe>".html_safe
  end

  private

  def render_erb(text)
    ::ActionView::Template.new(text, 'inline template', erb_handler, locales: []).render(self, {})
  end

  def erb_handler
    @@erb_handler ||= ::ActionView::Template.registered_template_handler(:erb)
  end

end
