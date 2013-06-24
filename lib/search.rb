class Search

  def self.search(*args)
    @wrapper.search(*args)
  end

  def self.add_documents(documents)
    @wrapper.add_documents(documents)
  end

  def self.add_function(num, fn)
    @wrapper.add_function(num, fn)
  end

  def self.delete_index
    @wrapper.delete_index
  end

  def self.wrapper=(wrapper)
    @wrapper = wrapper
  end

end
