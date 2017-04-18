require './lib/knight_moves'
require './lib/node'

describe 'Node' do
        before do
            @node = Node.new(1,2)
        end
    it 'initializes x' do
        expect(@node.x).to eql(1)
    end
    it 'initializes y' do
        expect(@node.y).to eql(2)
    end
    it 'initializes parent to nil' do
        expect(@node.parent).to eql(nil)
    end
    it 'initializes with non-nil parent' do
        @child_node = Node.new(1, 2, @node)
        expect(@child_node.parent).to be_an_instance_of(Node)
    end

    it '#make_children' do
        expect(@node.make_children.size).to eql(3)
    end
    
end

describe '#check_input' do
    it 'returns RuntimeError if input not array' do
        expect{ knight_moves(2,[3]) }.to raise_error(StandardError, 'Bad Data Type')
        expect{ knight_moves([2],3) }.to raise_error(StandardError, 'Bad Data Type')
    end

    it 'returns RuntimeError if array length != 2' do
        expect{ knight_moves([1,2], [3]) }.to raise_error(StandardError, 'Insufficient Arguments')
        expect{ knight_moves([1], [2,3]) }.to raise_error(StandardError, 'Insufficient Arguments')
    end

    it 'returns RuntimeError if location not between 1 and 8' do
        expect{ knight_moves([0,2],[3,4]) }.to raise_error(StandardError, 'Invalid Locations')
        expect{ knight_moves([1,2],[0,4]) }.to raise_error(StandardError, 'Invalid Locations')
        expect{ knight_moves([1,9],[3,4]) }.to raise_error(StandardError, 'Invalid Locations')
        expect{ knight_moves([1,2],[3,9]) }.to raise_error(StandardError, 'Invalid Locations')
    end

    it 'doesn\'t raise errors with correct locations' do
        expect{ knight_moves([1,8],[8,1]) }.to_not raise_error
    end
end

describe '#search' do
    it 'finds one-step search location' do
        start_loc = Node.new(1,1)
        stop_loc = Node.new(2,3)
        @node = search(stop_loc, start_loc)
        expect(@node.x).to eql(2)
        expect(@node.y).to eql(3)
    end

    it 'finds multi-step path' do
        start_loc = Node.new(3,3)
        stop_loc = Node.new(4,3)
        @node=search(stop_loc, start_loc)
        expect(@node.x).to eql(4)
        expect(@node.y).to eql(3)
        expect(@node.parent.x).to eql(6)
        expect(@node.parent.parent.x).to eql(4)
        expect(@node.parent.parent.parent.x).to eql(3)
    end
end
        
describe '#knight_moves' do
    it 'returns correct path' do
        @moves = knight_moves([3,3], [4,3])
        expect(@moves).to eql([[3, 3], [4, 5], [6, 4], [4, 3]])
    end
end