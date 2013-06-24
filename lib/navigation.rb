require 'yaml'
require 'active_support/core_ext'

class Navigation

  def self.section_from_permalink(permalink)
    section = nil

    tree.each do |sec, items|
      items.each do |plink, title|
        if title.is_a?(Hash)
          if title.find { |plink2, title| plink2 == permalink }
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

  def self.page_title_from_permalink(permalink)
    pages.fetch(permalink, permalink.split('/').last.gsub('-', ' ').humanize)
  end

  def self.tree
    @tree ||= YAML.load_file(Rails.root.join('config', 'navigation.yml'))
  end

  def self.sections
    @sections ||= tree.keys
  end

  def self.pages
    @pages ||= begin
      p = {}
      tree.each { |k, h| p.merge!(h) }
      p
    end
  end

  def self.unmemoize_all
    @tree, @sections, @pages = nil, nil, nil
  end

end
