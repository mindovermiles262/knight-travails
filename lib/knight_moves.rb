def knight_moves(start, stop)
    raise "bad data type input" unless start.class && stop.class == Array
    raise "insufficient arguments" unless start.length && stop.length == 2
end

knight_moves([33] , [65])