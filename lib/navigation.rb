require 'yaml'
module Navigation

  class << self
    def menu_title(permalink)
      pages.fetch(permalink, permalink.split('/').last.gsub('-', ' ').humanize)
    end

    def sections
      @sections ||= tree.keys
    end

    def pages
      @pages ||= begin
        p = {}
        tree.each { |k, h| p.merge!(h) }
        p
      end
    end

    def section_for_page(permalink)
      if section = tree.find { |section, items| items.find { |plink, title| plink == permalink } }
        section[0]
      else
        ''
      end
    end

    def tree
      @tree ||= YAML.load_file(Rails.root.join('config', 'navigation.yml'))
    end
  end

end
