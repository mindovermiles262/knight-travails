def knight_moves(start, stop)
    # check input
    raise StandardError, "Bad Data Type" unless start.class == Array && stop.class == Array
    raise StandardError, "Insufficient Arguments" unless start.length ==2 && stop.length == 2
    start.each do |x|
        return raise StandardError, "Invalid Locations" if (x > 8 || x < 1)
    end
    stop.each do |x|
        return raise StandardError, "Invalid Locations" if (x > 8 || x < 1)
    end

    # draw board and knight 
    puts "\n       Your Game Board"
    board_boxes = Array.new(10,"  ")
    board_lines = "  -------------------------"
    puts board_lines
    8.times do
        puts board_boxes.join("|")
        puts board_lines
    end
end

knight_moves([1,2],[3,4])