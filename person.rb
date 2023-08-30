require './nameable'
require './capitalizedecorator'
require './trimmerdecorator'
class Person < Nameable
  attr_accessor :name, :age
  attr_reader :id, :parent_permission

  def initialize(age, name = 'unknown', parent_permission: true)
    @id = rand(1..10_000)
    @name = name
    @age = age
    @parent_permission = parent_permission
  end

  def can_use_services?
    of_age? || @parent_permission
  end
def correct_name
  @name
end
  private

  def of_age?
    @age >= 18
  end
end
person = Person.new(22, 'maximilianus')
puts person.correct_name
capitalized_person = CapitalizeDecorator.new(person)
puts capitalized_person.correct_name
capitalized_trimmed_person = TrimmerDecorator.new(capitalized_person)
puts capitalized_trimmed_person.correct_name