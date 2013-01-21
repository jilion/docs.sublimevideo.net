require 'navigation'
require 'complex_page'

module DocsHelper

  def sublimevideo_docs_include_tag
    case params[:stage]
    when 'beta'
      sublimevideo_loader_tag(:www, stage: 'beta').html_safe
    else
      sublimevideo_loader_tag(:www).html_safe
    end
  end

  def title(title)
    @page_title = title
  end

  def display_menu
    html = ''
    Navigation.tree(params[:stage]).each do |section, items|
      if params[:stage] != 'stable'
        # html += content_tag(:h3, link_to(section, '#'), class: 'accordion') + content_tag(:ul, submenu(items), class: ['pages', params[:stage]])
        html += content_tag(:h3, section, class: 'accordion') + content_tag(:ul, submenu(items), class: ['pages', params[:stage]])
      else
        html += content_tag(:h3, section) + content_tag(:ul, submenu(items), class: ['pages', params[:stage]])
      end
    end
    raw html
  end

  def display_complex_page_index(page)
    html = ''
    ComplexPage.tree(params[:stage], page).each do |permalink, title|
      html += content_tag(:li, link_to(title.html_safe, "##{permalink}"))
    end
    raw content_tag :ul, html.html_safe
  end

  def display_complex_page_list(page)
    html = []
    ComplexPage.tree(params[:stage], page).each do |permalink, title|
      html << content_tag(:h3, link_to(title.html_safe, "##{permalink}", id: permalink))
      html << "\n\n#{File.new(Rails.root.join(page_realpath(params[:stage], [page, permalink], partial: true))).read}"
    end

    render_erb(html.join(''))
  end

  def section_and_page_title_from_permalink(stage, permalink)
    if section = Navigation.section_from_permalink(stage, permalink)
      "#{section[0]}: " + (section.size == 2 ? "#{section[1]} > " : '') + Navigation.page_title_from_permalink(stage, permalink)
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
      link_to(title, "#{params[:stage] != 'stable' ? "/#{params[:stage]}" : ''}/#{page}")
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
