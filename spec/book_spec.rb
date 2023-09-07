require_relative '../book'
require_relative '../rentals'
describe Book do
  before :each do
    @book = Book.new('Fire', 'John Smith')
    @person = Person.new(30, 'Alice', 'Maths')
  end
  describe '#add_rental' do
    it 'adds a rental to the book' do
      rental = @book.add_rental(@date, @person)
      expect(rental.book).to eq(@book)
      expect(rental.person).to eq(@person)
      expect(rental.date).to eq(@date)
      expect(@book.rentals).to include(rental)
    end
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
