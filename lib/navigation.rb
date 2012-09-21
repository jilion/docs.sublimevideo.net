require 'yaml'
module Navigation

  class << self
    def section_from_permalink(version, permalink)
      section = nil

      tree(version).each do |sec, items|
        items.each do |plink, title|
          if title.is_a?(Hash)
            if title.find { |plink2, title| plink2 == permalink }.present?
              section = [sec, plink]
              break
            end
          else
            if plink == permalink
              section = [sec]
              break
            end
          end
        end
      end

      section
    end

    def page_title_from_permalink(version, permalink)
      pages(version).fetch(permalink, permalink.split('/').last.gsub('-', ' ').humanize)
    end

    def tree(version = 'stable')
      @tree ||= {}
      @tree[version] ||= YAML.load_file(Rails.root.join('config', 'navigation.yml'))[version]
    end

    def sections(version = 'stable')
      @sections ||= {}
      @sections[version] ||= tree(version).keys
    end

    def pages(version = 'stable')
      @pages ||= {}
      @pages[version] ||= begin
        p = {}
        tree(version).each { |k, h| p.merge!(h) }
        p
      end
    end

    def unmemoize_all
      @tree, @sections, @pages = nil, nil, nil
    end
  end

end
