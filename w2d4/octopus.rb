class Array
  def merge_sort(&prc)

    return self if length <=1
    prc||=proc{|el1,el2| el1<=>el2}
    mid = length/2
    left = self.take(mid).merge_sort(&prc)
    right = self.drop(mid).merge_sort(&prc)
    Array.merge(left, right, &prc)
  end

  private
  def self.merge(left, right, &prc)
    result = []
    until left.empty? || right.empty?
      result<<(prc.call(left.first, right.first)<=0 ? left.shift : right.shift)
    end
    result.concat(left+right)
  end
end

def sluggish_octopus(arr)
  arr.each do |octo|
    return octo if arr.all? {|el| octo.length >= el.length}
  end
end

def dominant_octopus(arr)
  prc = Proc.new{|fish1, fish2| fish1.length<=>fish2.length}
  arr.merge_sort(&prc).last
end

def clever_octopus(arr)
  biggest = arr[0]
  arr[1..-1].each do |fish|
    biggest = fish if fish.length > biggest.length
  end
  biggest
end

def slow_dance(dir, arr)
  arr.index(dir)
end

def fast_dance(dir, tiles)
  p tiles[dir]
end




if $PROGRAM_NAME == __FILE__
  arr = ['fish', 'fiiish', 'fiiiiish', 'fiiiish', 'fffish', 'ffiiiiisshh', 'fsh', 'fiiiissshhhhhh']
  #
  # p sluggish_octopus(arr)
  # p dominant_octopus(arr)
  # p clever_octopus(arr)

  tiles_array = ["up", "right-up", "right", "right-down", "down", "left-down", "left",  "left-up" ]

  tile_hash = {"up" => 0, "right-up"=>1, "right"=>2, "right-down"=>3, "down"=>4, "left-down"=>5, "left"=>6,  "left-up"=>7 }

  fast_dance("up", tile_hash)

  fast_dance("right-down", tile_hash)

end
