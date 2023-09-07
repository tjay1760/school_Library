require_relative '../rentals'
require_relative '../book'
require_relative '../person'
describe Rental do
  before(:each) do
    @book = Book.new('Heads First HTML', 'Steve Jobs')
    @person = Person.new(25, 'HTML', 'John')
    @rental = Rental.new('2023-05-03', @book, @person)
  end

  describe '#initialize' do
    it 'creates a rental with a date, book, and person' do
      expect(@rental.date).to eq('2023-05-03')
      expect(@rental.book).to eq(@book)
      expect(@rental.person).to eq(@person)
      expect(@book.rentals).to eq([@rental])
      expect(@person.rentals).to eq([@rental])
    end
  end
end
