class Stack
    def initialize
      @internal_arr = []
    end

    def push(el)
      internal_arr.push(el)
    end

    def pop
      internal_arr.pop(el)
    end

    def peek
      internal_arr.last
    end

    private
    attr_accessor :internal_arr
  end


class Queue
  def initialize
    @internal_arr = []
  end

  def enqueue(el)
    internal_arr.push(el)
  end

  def dequeue
    internal_arr.shift
  end

  def peek
    internal_arr.first
  end

  private
  attr_accessor :internal_arr
end

class Map
  def initialize
    @map_arr = []
    @keys = []
  end

  def set(key, value)
    map_arr << [key, value] if keys.none?{|k| k == key}
    keys << key
  end

  def get(key)
    map_arr.index(key)
  end

  def delete(key)
    if keys.include?(key)
      return map_arr.select{|pair| pair[0]==key}
    else
      nil
    end
  end

  def show
    p map_arr
  end

  private
  attr_accessor :map_arr, :keys
end
