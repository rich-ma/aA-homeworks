class Board
  attr_accessor :cups

  def initialize(name1, name2)
    @cups = Array.new(14){Array.new}
    place_stones
    @player1 = name1
    @player2 = name2
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
    i = 1
    until stones_in_hand.empty?
      i = i % @cups.length
      # if (start_pos+1)==6 && @current_player_name != @player1
      #   i += 1
      #   next
      # end
      # if (start_pos+1)==13 && @current_player_name != @player2
      #   i += 1
      #   next
      # end
      p @cups[start_pos+i]
      p stones_in_hand
      @cups[start_pos + i] << stones_in_hand.shift
      i += 1 unless stones_in_hand.empty?
    end
    render
    return :switch if @cups[start_pos+ i].length == 1
  end

  def next_turn(ending_cup_idx)
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
