require_relative 'person'
class PersonLister
  def initialize(people)
    @people = people
  end

  def list_all_people
    return puts 'No people available' if @people.empty?

    @people.each_with_index do |person, index|
      puts "#{index}) Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
    end
  end
end
