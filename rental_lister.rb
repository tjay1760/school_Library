require_relative 'rentals'
class RentalLister
  def initialize(rentals, people, books)
    @rentals = rentals
    @people = people
    @books = books
  end

  def list_rentals
    rental_list = []
    puts 'Enter person id'
    id = gets.chomp.to_i
    @rentals.each do |rental|
      if rental.person.id == id
        rental_list << "Date: #{rental.date}, Book: '#{rental.book.title}' Author: #{rental.book.author}"
      end
    end
    return rental_list.each { |rental| puts rental } unless rental_list.empty?

    puts 'No record found for the selected person'
  end
end
