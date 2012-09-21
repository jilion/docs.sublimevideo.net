require 'yaml'
module ComplexPage

  class << self
    def tree(page)
      @tree ||= {}
      @tree[page] ||= YAML.load_file(Rails.root.join('config', 'complex_pages', "#{page}.yml"))
    end
  end

end
