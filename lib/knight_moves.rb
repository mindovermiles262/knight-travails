require './lib/node'

def knight_moves(start, stop)
   check_input(start, stop)

    # convert location arrays to objects
    start_object = Node.new(start[0], start[1])
    stop_object = Node.new(stop[0], stop[1])

    # Get path from end location to start location
    find_path = search(stop_object, start_object)

    # Get route of knight
    route = []
    route.unshift([find_path.x, find_path.y])
    current_node = find_path.parent
    until current_node.nil?
        route.unshift([current_node.x, current_node.y])
        current_node = current_node.parent
    end
    
    # Print route to user
    puts "You made it in #{route.size - 1} moves!"
    puts "Your Path: #{route}"
    return route
   
end

def search(search, starting_location)
    queue = Array.new
    queue << starting_location

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

knight_moves([3,3], [4,3]) # > [3, 3] [4, 5] [6, 4] [4, 3]
#knight_moves([1,1], [4,4]) # > [1, 1] [2, 3] [4, 4]