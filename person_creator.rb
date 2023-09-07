require_relative 'student'
require_relative 'teacher'
require_relative 'person'
class PersonCreator
  def initialize(people)
    @people = people
  end

  def create_a_person
    puts 'Do you want to create a student [1] or teacher [2]?'
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
    puts 'Enter Age'
    age = gets.chomp.to_i
    puts 'Enter name'
    name = gets.chomp
    puts 'Has parent permission [Y/N]'
    permission = gets.chomp.upcase
    if permission == 'Y'
      student = Student.new(age, 'classroom', name, parent_permission: true)
      @people << student
      puts 'Student created successfully'
    elsif permission == 'N'
      student = Student.new(age, 'classroom', name, parent_permission: false)
      @people << student
      puts 'Student created successfully'
    else
      puts 'Invalid Input'
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
end
