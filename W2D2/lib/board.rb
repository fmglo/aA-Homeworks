class Board
  attr_accessor :cups

  def initialize(name1, name2)
    @name1 = name1
    @name2 = name2
    @cups = Array.new(14) {Array.new}
    place_stones
  end

  def place_stones
    @cups[0..5].each do |cup|
      4.times do cup << :stone
      end
    end
  end

  def valid_move?(start_pos)
    begin
      if start_pos > 14
        raise "Invalid starting cup"
      end
    end

    begin
      if @cups[start_pos].empty?
        raise "Starting cup is empty"
      end
    end
  end

  def make_move(start_pos, current_player_name)

    stones = @cups[start_pos]
    @cups[start_pos] = []


    cup_idx = start_pos
    until stones.empty?
      cup_idx += 1
      cup_idx = 0 if cup_idx > 13

      if cup_idx == 6
        @cups[6] << stones.pop if current_player_name == @name1
      elsif cup_idx == 13
        @cups[13] << stones.pop if current_player_name == @name2
      else
        @cups[cup_idx] << stones.pop
      end
    end

    render
    next_turn(cup_idx)
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
    side1 = @cups[0...6]
    side2 = @cups[7...13]

    if side1.all? {|cup| cup.empty? } || side2.all? {|cup| cup.empty?}
      true
    else
      false
    end
  end

  def winner

  end
end
