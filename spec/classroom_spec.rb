require_relative '../classroom'

describe Classroom do
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
