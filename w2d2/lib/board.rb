class Board
  attr_accessor :cups

  def initialize(name1, name2)
    @cups = Array.new(14){Array.new}
    place_stones
    @name1 = name1
    @name2 = name2
    @current_player_name = name1
  end

  def place_stones
    @cups[0..5].each {|cup| cup << :stone until cup.length == 4}
    @cups[7..12].each {|cup| cup << :stone until cup.length == 4}
  end


  def valid_move?(start_pos)
    raise "Invalid starting cup" if start_pos < 0 || start_pos > 13
    raise "Starting cup is empty" if @cups[start_pos].empty?
  end

  def make_move(start_pos, current_player_name)
    stones_in_hand = @cups[start_pos].dup
    @cups[start_pos] = []
    curr_pos = start_pos
    until stones_in_hand.empty?
      curr_pos += 1
      curr_pos = curr_pos % @cups.length
      if curr_pos==6 && @current_player_name==@name1
        @cups[curr_pos] << stones_in_hand.shift
      elsif curr_pos==13 && @current_player_name==@name2
        @cups[curr_pos] << stones_in_hand.shift
      else
        @cups[curr_pos] << stones_in_hand.shift
      end
    end
    render
    next_turn(curr_pos)
  end

  def next_turn(ending_cup_idx)
    p "ending cup is"
    p ending_cup_idx
    return :prompt if ending_cup_idx == 6 && @current_player_name == @name1
    return :prompt if ending_cup_idx == 13 && @current_player_name == @name2
    return :switch if @cups[ending_cup_idx].length == 1
    # helper method to determine whether #make_move returns :switch, :prompt, or ending_cup_idx
  end

  def render
    print "      #{@cups[7..12].reverse.map { |cup| cup.count }}      \n"
    puts "#{@cups[13].count} -------------------------- #{@cups[6].count}"
    print "      #{@cups.take(6).map { |cup| cup.count }}      \n"
    puts ""
    puts ""
  end

  def one_side_empty?
    return true if @cups[0..5].all?{|cup| cup.empty?}
    return true if @cups[7..12].all?{|cup| cup.empty?}
    false
  end

  def winner
  end
end
