require_relative '../book'

describe Book do
  before :each do
    @book = Book.new('Fire', 'John Smith')
  end
  describe '#Books' do
    it 'checks for author and title' do
      expect(@book.title).to eq('Fire')
      expect(@book.author).to eq('John Smith')
    end
  end
  describe '#to_h' do
    it 'returns a hash with title and author' do
      expect(@book.to_h).to eq({ title: 'Fire', author: 'John Smith' })
    end
  end
end
