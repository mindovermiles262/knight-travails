require './lib/knight_moves'

describe 'knight_moves' do
    describe 'initialization' do
        it 'returns RuntimeError if input not array' do
            expect{ knight_moves(2,[3]) }.to raise_error(StandardError, 'bad data type')
            expect{ knight_moves([2],3) }.to raise_error(StandardError, 'bad data type')
        end

        it 'returns RuntimeError if array length != 2' do
            expect{ knight_moves([1,2], [3]) }.to raise_error(StandardError, 'insufficient arguments')
            expect{ knight_moves([1], [2,3]) }.to raise_error(StandardError, 'insufficient arguments')
        end

# Left off 04/11
        it 'returns RuntimeError if location not between 1 and 8' do
            expect{ knight_moves([0,1],[2,3]) }.to raise_error(StandardError, 'invalid locations')
        end
    end
end