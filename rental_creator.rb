require_relative 'rentals'
require_relative 'book'
require_relative 'person'
class RentalCreator
    def initialize(books, people, rentals)
        @books = books
        @people = people
        @rentals = rentals
      end
      def create_a_rental
        puts 'Select a book from the following list by number'
        book_lister = BookLister.new(@books)
        book_lister.list_all_books
        book_id = gets.chomp.to_i
        puts 'Select a person by number'
        person_lister = PersonLister.new(@people)
        person_lister.list_all_people
        person_id = gets.chomp.to_i
        puts 'Enter date'
        date = gets.chomp
        rental = Rental.new(date, @books[book_id], @people[person_id])
        @rentals << rental
        puts 'created a rental.'
      end
    
end