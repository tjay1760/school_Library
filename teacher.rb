require './person'
class Teacher < Person
  attr_reader :specialization, :name

  def initialize(specialization, age, name, parent_permission: true)
    super(age, name, parent_permission)
    @specialization = specialization
    @name = name
    @rentals = []
  end

  def can_use_services?
    true
  end
  def to_h
    {
      type: self.class.name,
      id: @id,
      name: @name,
      age: @age,
      specialization: @specialization
    }
  end
  def id=(value)
    @id = value
  end
end
