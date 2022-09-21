class Player
    def get_move
        p "enter a position with coordinates separated with a space like `4 7`"
        user_in = gets.chomp
        user_in.split(" ").flatten.map {|num| num.to_i}
    end

end
