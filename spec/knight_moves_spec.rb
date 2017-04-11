require './lib/knight_moves'

define 'knight_moves' do
    define 'initialization' do
        it 'returns RuntimeError if input not array' do
            expect(knight_moves(22, [34])).to raise_exception
        end
    end
end