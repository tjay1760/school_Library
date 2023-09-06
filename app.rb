require 'fileutils'
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
require 'json'
require_relative 'people_loader'
require_relative 'book_loader'
require_relative 'rental_loader'
class App
  attr_accessor :books, :people, :rentals, :book_creator, :book_lister, :person_creator, :person_lister, :rental_creator, :rental_lister
Books_file = './books.json'.freeze
Poeple_file = './poeple.json'.freeze
Rentals_file = './rentals.json'.freeze
  def initialize
    @people = read_people(Poeple_file)||[]
    @books = read_books(Books_file)||[]
    @rentals = read_rentals(Rentals_file)||[]
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
    save_json(@books, Books_file)
    save_json(@people, Poeple_file)
    save_json(@rentals, Rentals_file)
  end
end
