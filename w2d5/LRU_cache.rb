class LRUCache
  attr_reader :arr, :max_size
  def initialize(size)
    @arr = Array.new(size)
    @max_size = size
  end

  def count
    arr.length# returns number of elements currently in cache
  end

  def add(el)
    arr.delete(el) if arr.include?(el)
    arr.shift if arr.length == @max_size
    arr.push(el)

  end

  def show
    p arr.dup
  end

  private
  attr_writer :arr

end

if $PROGRAM_NAME == __FILE__
  johnny_cache = LRUCache.new(4)

    johnny_cache.add("I walk the line")
    johnny_cache.add(5)

    johnny_cache.count

    johnny_cache.add([1,2,3])
    johnny_cache.add(5)
    johnny_cache.add(-5)
    johnny_cache.add({a: 1, b: 2, c: 3})
    johnny_cache.add([1,2,3,4])
    johnny_cache.add("I walk the line")
    johnny_cache.add(:ring_of_fire)
    johnny_cache.add("I walk the line")
    johnny_cache.add({a: 1, b: 2, c: 3})


    johnny_cache.show



end
