require './person'
class Teacher < Person
  attr_reader :specialization, :name
  def initialize(specialization, age, name , parent_permission: true)
    super(age, name, parent_permission)
    @specialization = specialization
    @name = name
  end

  def can_use_services?
    true
  end
end
teacher1 = Teacher.new("MAsters", 53,"LImo")
puts teacher1.name
puts teacher1.specialization
puts teacher1.age