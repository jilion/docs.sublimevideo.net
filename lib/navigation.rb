require 'yaml'
module Navigation

  class << self
    def section_from_permalink(stage, permalink)
      section = nil

      tree(stage).each do |sec, items|
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

    def page_title_from_permalink(stage, permalink)
      pages(stage).fetch(permalink, permalink.split('/').last.gsub('-', ' ').humanize)
    end

    def tree(stage = 'stable')
      @tree ||= {}
      @tree[stage] ||= YAML.load_file(Rails.root.join('config', 'navigation.yml'))[stage]
    end

    def sections(stage = 'stable')
      @sections ||= {}
      @sections[stage] ||= tree(stage).keys
    end

    def pages(stage = 'stable')
      @pages ||= {}
      @pages[stage] ||= begin
        p = {}
        tree(stage).each { |k, h| p.merge!(h) }
        p
      end
    end

    def unmemoize_all
      @tree, @sections, @pages = nil, nil, nil
    end
  end

end
