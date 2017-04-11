def knight_moves(start, stop)
    # check input
    raise StandardError, "bad data type" unless start.class == Array && stop.class == Array
    raise StandardError, "insufficient arguments" unless start.length ==2 && stop.length == 2

    # Left off 04/11
    raise StandardError, "invalid locations" unless start.each { |x| x > 0 && x < 9 }
end
