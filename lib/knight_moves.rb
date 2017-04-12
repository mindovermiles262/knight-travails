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

    
end
