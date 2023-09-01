require_relative 'person'
require_relative 'student'
require_relative 'teacher'
require_relative 'book'
# require_relative 'rentals'
require_relative 'classroom'

class Rental
    attr_accessor :date, :book, :person
  
    def initialize(date, book, person)
      @date = date
      @book = book
      @person = person
  
      book.rentals << self
      person.rentals << self
    end
  end
  
class App
    attr_accessor :books, :people, :rentals
    def initialize
        @people = []
        @books = []
        @rentals = []
    end
def list_all_books
return puts "No books available" if @books.empty?
@books.each_with_index { |book, index| puts "#{index}. Title: #{book.title} Author: #{book.author}"} 
end
def list_all_people
return puts "No people available" if @people.empty?
@people.each_with_index do |person, index|  
    puts "#{index}) Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
end
end
def create_a_person
    puts "Do you want to create a student [1] or teacher [2]?"
    choice = gets.chomp
    if choice == '1'
        create_student
    elsif choice == '2'
        create_teacher
    else
        puts 'Invalid input. Please enter 1 to create a student or 2 to create a teacher.'
    end
end
def create_student
    puts "Enter Age"
    age = gets.chomp.to_i
    puts "Enter name"
    name = gets.chomp
    puts "Has parent permission [Y/N]"
    permission = gets.chomp.upcase
    if permission == "Y"
      student = Student.new(age, 'classroom', name, parent_permission: true)
      @people << student
      puts 'Student created successfully'
    elsif permission == "N"
      student = Student.new(age, 'classroom', name, parent_permission: false)
      @people << student
      puts 'Student created successfully'
    else
      puts "Invalid Input"
    end
  end
  def create_teacher
    puts 'Enter teacher name'
    name = gets.chomp
    print 'Enter age: '
    age = gets.chomp.to_i
    print 'Enter Specialization: '
    specialization = gets.chomp
    teacher = Teacher.new(specialization, age, name)
    @people << teacher
    puts 'Teacher created successfully'
  end
  def create_book
    print 'Title: '
    title = gets.chomp
    print 'Enter the Author name: '
    author = gets.chomp
    book = Book.new(title, author)
    @books << book
    puts 'Book created successfully'
  end
def create_a_rental
puts 'Select a book from the following list by number'
list_all_books   
book_id = gets.chomp.to_i
puts "Select a person by number"
list_all_people
person_id = gets.chomp.to_i
puts "Enter date"
date = gets.chomp
rental = Rental.new(date, books[book_id], people[person_id])
    @rentals << rental
    puts 'created a rental.'
end
def list_rentals
end
end
app = App.new()
app.create_a_person
app.create_a_person
app.create_book
app.create_book
app.create_a_rental