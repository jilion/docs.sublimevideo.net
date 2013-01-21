require 'redcloth'

module ActionView::Template::Handlers
  class Textile

    def erb_handler
      @@erb_handler ||= ActionView::Template.registered_template_handler(:erb)
    end

    def call(template)
      compiled_source = erb_handler.call(template)
      "RedCloth.new(begin;#{compiled_source.html_safe};end).to_html"
    end

  end
end

ActionView::Template.register_template_handler :textile, ActionView::Template::Handlers::Textile.new
