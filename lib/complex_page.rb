require 'yaml'
module ComplexPage

  class << self
    def tree(stage, page)
      tree = YAML.load_file(Rails.root.join('config', 'complex_pages', "#{page}.yml"))
      tree.delete(stage) || tree.delete('stable')
    end
  end

end
