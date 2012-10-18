module Search

  class << self

    def search(stage, *args)
      @wrapper.search(stage, *args)
    end

    def add_documents(stage, documents)
      @wrapper.add_documents(stage, documents)
    end

    def add_function(stage, num, fn)
      @wrapper.add_function(stage, num, fn)
    end

    def delete_index(stage)
      @wrapper.delete_index(stage)
    end

    def wrapper=(wrapper)
      @wrapper = wrapper
    end

  end
end
