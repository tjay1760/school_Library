class Person
  attr_accessor :name, :age
  attr_reader :id, :parent_permission

  def initialize(age, name = 'unknown', parent_permission: true)
    @id = rand(1..10_000)
    @name = name
    @age = age
    @parent_permission = parent_permission
  end

  def of_age?
    @age >= 18
  end

  def can_use_services?
    of_age? || @parent_permission
  end
end

Person.new(40, 'John')
