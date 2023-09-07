require './person'
class Student < Person
  attr_reader :classroom

  def initialize(age, classroom, name, parent_permission: true)
    super(age, name, parent_permission)
    @classroom = classroom
    @name = name
    @rentals = []
  end

  def classroom=(classroom)
    @classroom = classroom
    classroom.students.push(self) unless classroom.students.include?(self)
  end

  def play_hooky
    '¯\\(ツ)/¯'
  end

  def to_h
    {
      type: self.class.name,
      id: @id,
      name: @name,
      age: @age,
      parent_permission: @parent_permission,
      classroom: @classroom
    }
  end

  def id=(value)
    @id = value
  end
end
