require './lib/node'

def knight_moves(start, stop)
   check_input(start, stop)

end

def search(search, parent)
    queue = Array.new
    queue << parent

    until queue.empty?
        current_node = queue.shift
        if current_node.x == search.x && current_node.y == search.y
            return current_node
        else
            current_node.make_children.each { |child| queue << child }
        end
    end
end


def check_input(start, stop)
    # checks user input for valid starting and ending locations on board
    raise StandardError, "Bad Data Type" unless start.class == Array && stop.class == Array
    raise StandardError, "Insufficient Arguments" unless start.length ==2 && stop.length == 2
    start.each do |x|
        return raise StandardError, "Invalid Locations" if (x > 8 || x < 1)
    end
    stop.each do |x|
        return raise StandardError, "Invalid Locations" if (x > 8 || x < 1)
    end 
end