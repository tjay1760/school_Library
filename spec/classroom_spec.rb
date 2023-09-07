require_relative '../classroom'
require_relative '../student'

describe Classroom do
  describe '#add_student' do
    it 'adds a student to the classroom' do
      classroom = Classroom.new('Javascript')
      student = Student.new(20, 'Alice', 'Math')

      classroom.add_student(student)

      expect(classroom.students).to include(student)
      expect(student.classroom).to eq(classroom)
    end
  end

  describe '#Classroom' do
    it 'creates a new Classroom' do
      classroom = Classroom.new('Javascript')
      expect(classroom.label).to eq('Javascript')
    end
    it 'check valid class' do
      expect { Classroom.new }.to raise_exception(ArgumentError)
    end
  end
end
