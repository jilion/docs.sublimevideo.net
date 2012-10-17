require 'yaml'
module ComplexPage

  class << self
    def tree(version, page)
      tree = YAML.load_file(Rails.root.join('config', 'complex_pages', "#{page}.yml"))
      tree.delete(version) || tree.delete('stable')
    end
  end

end
