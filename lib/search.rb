module Search

  class << self

    def search(version, *args)
      @wrapper.search(version, *args)
    end

    def add_documents(version, documents)
      @wrapper.add_documents(version, documents)
    end

    def add_function(version, num, fn)
      @wrapper.add_function(version, num, fn)
    end

    def delete_index(version)
      @wrapper.delete_index(version)
    end

    def wrapper=(wrapper)
      @wrapper = wrapper
    end

  end
end
