require 'fileutils'
require_relative 'person'
require_relative 'student'
require_relative 'teacher'
require_relative 'book'
require_relative 'rentals'
require_relative 'classroom'
require_relative 'book_creator'
require_relative 'book_lister'
require_relative 'person_creator'
require_relative 'person_lister'
require_relative 'rental_creator'
require_relative 'rental_lister'
require 'json'
require_relative 'people_loader'
require_relative 'book_loader'
require_relative 'rental_loader'
class App
  attr_accessor :books, :people, :rentals, :book_creator, :book_lister, :person_creator, :person_lister,
                :rental_creator, :rental_lister

  BOOKS_FILE = './books.json'.freeze
  POEPLE_FILE = './poeple.json'.freeze
  RENTALS_FILE = './rentals.json'.freeze
  def initialize
    @people = read_people(POEPLE_FILE) || []
    @books = read_books(BOOKS_FILE) || []
    @rentals = read_rentals(RENTALS_FILE) || []
    @book_creator = BookCreator.new(@books)
    @book_lister = BookLister.new(@books)
    @person_creator = PersonCreator.new(@people)
    @person_lister = PersonLister.new(@people)
    @rental_creator = RentalCreator.new(@books, @people, @rentals)
    @rental_lister = RentalLister.new(@rentals, @people, @books)
  end

  def save_json(data, file_path)
    dir_path = File.dirname(file_path)
    FileUtils.mkdir_p(dir_path)
    File.write(file_path, JSON.generate(data.map(&:to_h)))
  end

  def save_data
    save_json(@books, BOOKS_FILE)
    save_json(@people, POEPLE_FILE)
    save_json(@rentals, RENTALS_FILE)
  end
end
