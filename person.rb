require './nameable'
require './capitalizedecorator'
require './trimmerdecorator'
class Person < Nameable
  attr_accessor :name, :age
  attr_reader :id, :parent_permission

  def initialize(age, name = 'unknown', parent_permission: true)
    super()
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
