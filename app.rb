require_relative 'person'
require_relative 'student'
require_relative 'teacher'
require_relative 'book.rb'
require_relative 'rentals'
require_relative 'classroom'
require_relative 'book_creator'
require_relative 'book_lister'
require_relative 'person_creator'
require_relative 'person_lister'
require_relative 'rental_creator'
require_relative 'rental_lister'
class App
  attr_accessor :books, :people, :rentals, :book_creator, :book_lister, :person_creator, :person_lister, :rental_creator, :rental_lister

  def initialize
    @people = []
    @books = []
    @rentals = []
    @book_creator = BookCreator.new(@books)
    @book_lister = BookLister.new(@books)
    @person_creator = PersonCreator.new(@people)
    @person_lister = PersonLister.new(@people)
    @rental_creator = RentalCreator.new(@books, @people, @rentals)
    @rental_lister = RentalLister.new(@rentals, @people, @books)
  end

end
