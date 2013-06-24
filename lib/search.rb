class Search

  def self.search(stage, *args)
    @wrapper.search(stage, *args)
  end

  def self.add_documents(stage, documents)
    @wrapper.add_documents(stage, documents)
  end

  def self.add_function(stage, num, fn)
    @wrapper.add_function(stage, num, fn)
  end

  def self.delete_index(stage)
    @wrapper.delete_index(stage)
  end

  def self.wrapper=(wrapper)
    @wrapper = wrapper
  end

end
