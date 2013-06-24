require 'yaml'

class ComplexPage

  def self.tree(page)
    YAML.load_file(Rails.root.join('config', 'complex_pages', "#{page}.yml"))
  end

end
