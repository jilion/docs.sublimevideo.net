module Search

  class << self

    def search(*args)
      @wrapper.search(*args)
    end

    def add_documents(documents)
      @wrapper.add_documents(documents)
    end

    def add_function(num, fn)
      @wrapper.add_function(num, fn)
    end

    def delete_index
      @wrapper.delete_index
    end

    def wrapper=(wrapper)
      @wrapper = wrapper
    end

  end
end
