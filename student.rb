require './person'
class Student < Person
  attr_reader :classroom

  def initialize(age, classroom, name, parent_permission: true)
    super(age, name, parent_permission)
    @classroom = classroom
    @name = name
  end

  def classroom=(classroom)
    @classroom = classroom
    classroom.students.push(self) unless classroom.students.include?(self)
  end

  def play_hooky
    '¯\\(ツ)/¯'
  end
end
student1 = Student.new(50, 'classroom', "jaka", parent_permission: false)
puts student1.name
puts student1.age