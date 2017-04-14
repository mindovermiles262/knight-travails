class Node
    attr_accessor :x, :y, :parent

    def initialize(x, y, parent = nil)
        @x = x
        @y = y
        @parent = parent
    end

    def make_children
        moves = [ [@x+1, @y+2], [@x+2, @y+1], [@x+2, @y-1], [@x+1, @y-2], [@x-1, @y -2], [@x-2, @y-1], [@x-2, @y+1], [@x-1, @y+2] ]
        moves.select { |x| x[0]>=1 && x[0]<=8 && x[1]>=1 && x[1]<=8 }.map do |coordinates|
            Node.new(coordinates[0], coordinates[1], self)
        end
    end

end