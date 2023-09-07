require_relative '../person'
require_relative '../rentals'
require_relative '../book'

describe Person do
  describe "#initialize" do
    before(:each) do
      @person = Person.new(20, 'Classroom 101', 'John Doe', parent_permission: true)
      @book = Book.new('The Great Gatsby', 'F. Scott Fitzgerald')
    end

    it 'assigns age correctly' do
      expect(@person.age).to eq(20)
    end

    it 'assigns name correctly' do
      expect(@person.name).to eq('John Doe')
    end

    it 'assigns parent_permission correctly' do
      expect(@person.parent_permission).to be(true)
    end

    it 'generates a random id between 1 and 10,000' do
      expect(@person.id).to be >= 1
      expect(@person.id).to be <= 10_000
    end

    it 'assigns an empty rentals array' do
      expect(@person.rentals).to be_an(Array)
      expect(@person.rentals).to be_empty
    end

    it 'assigns classroom correctly' do
      expect(@person.instance_variable_get(:@classroom)).to eq('Classroom 101')
    end
    it 'adds a rental to the person' do
      rental = @person.add_rental('2023-09-07', @book)
      expect(rental).to be_an_instance_of(Rental)
      expect(rental.date).to eq('2023-09-07')
      expect(rental.book).to eq(@book)
      expect(rental.person).to eq(@person)
      expect(@person.rentals).to include(rental)
    end
    it 'increments the number of rentals for the person' do
      initial_rental_count = @person.rentals.length
      @person.add_rental('2023-09-07', @book)
      expect(@person.rentals.length).to eq(initial_rental_count + 1)
    end
  end

  describe '#can_use_services' do
    context 'Person is of age' do
      it 'can use services' do
        person = Person.new(50, 'Java', 'John')
        expect(person.can_use_services?).to be true
      end
    end

    context 'Person is underage but has parent permission' do
      it 'returns true' do
        person = Person.new(14, 'C', 'Luka', parent_permission: true)
        expect(person.can_use_services?).to be true
      end
    end

    context 'when the person is under 18 and does not have parent permission' do
      it 'returns false' do
        person = Person.new(1, 'Math', 'modric', parent_permission: false)
        expect(person.can_use_services?).to be false
      end
    end
  end
end
