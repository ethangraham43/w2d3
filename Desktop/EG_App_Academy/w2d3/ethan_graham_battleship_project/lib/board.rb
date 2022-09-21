class Board
    attr_reader :size


    def self.print_grid(arr)
        arr.each do |row|
            p row.join(" ")
        end
    end

  def initialize(n)
    @grid = Array.new(n) {Array.new(n, :N)}
    @size = (n*n)
  end

  def [](arr)
    row, col = arr
    @grid[row][col]
  end
  
  def []=(arr, val)
    row, col = arr
    @grid[row][col] = val
  end

  def num_ships
    count = 0
    @grid.flatten.each do |pos|
        count += 1 if pos == :S
    end
    count
  end

  def attack(pos)
    if self[pos] == :S
        self[pos]= :H
        p "you sunk my battleship!"
        return true
    else
        self[pos] = :X
        return false
    end
  end
  
  def place_random_ships
    ship_ct = @size * 0.25 
    while self.num_ships < ship_ct
        row = rand(0...@grid.length)
        col = rand(0...@grid.length)
        pos = [row, col]
        self[pos] = :S
    end
  end

  def hidden_ships_grid
    ret_arr = []
    @grid.each do |arr|
        new_arr = []
        arr.each do |pos|
            if pos == :S
                new_arr << :N
            else
                new_arr << pos
            end
        end
        ret_arr << new_arr
    end
    ret_arr
  end

  def cheat
    Board.print_grid(@grid)
  end

  def print
    Board.print_grid(self.hidden_ships_grid)
  end

end
