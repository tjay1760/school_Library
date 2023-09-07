require_relative '../student'
require_relative '../classroom'

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
end
