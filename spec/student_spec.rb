require_relative '../student'
require_relative '../classroom'
require_relative '../person'

describe Student do
  let(:classroom) { double('Classroom') }

  describe '#initialize' do
    it 'sets default values and assigns classroom' do
      student = Student.new(15, classroom, 'tjay')

      expect(student.id).to be_a(Integer)
      expect(student.name).to eq('tjay')
      expect(student.parent_permission).to be true
      expect(student.age).to eq(15)
      expect(student.classroom).to eq(classroom)
    end
  end

  describe '#play_hooky' do
    it 'plays hooky message' do
      student = Student.new(18, classroom, 'Tjay')
      expect(student.play_hooky).to eq('¯\\(ツ)/¯')
    end
  end

  describe '#to_h' do
    it 'returns a hash with the student information' do
      student = Student.new(16, classroom, 'Alice')

      expected_hash = {
        type: 'Student',
        id: student.id, # Since we haven't set an id
        name: 'Alice',
        age: 16,
        parent_permission: true,
        classroom: classroom
      }

      expect(student.to_h).to eq(expected_hash)
    end

    it 'includes custom id when set' do
      student = Student.new(16, classroom, 'Alice')
      student.id = 123

      expected_hash = {
        type: 'Student',
        id: 123,
        name: 'Alice',
        age: 16,
        parent_permission: true,
        classroom: classroom
      }

      expect(student.to_h).to eq(expected_hash)
    end
  end
end
