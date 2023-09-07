require_relative '../person'
require_relative '../teacher'

describe Teacher do
  describe '#initialize' do
    it 'should create a new Teacher' do
      teacher = Teacher.new('Math', 30, 'James')
      expect(teacher.specialization).to eq('Math')
      expect(teacher.age).to eq(30)
      expect(teacher.parent_permission).to eq(true)
      expect(teacher.name).to eq('James')
      expect(teacher.id).to be_a(Integer)
    end
  end

  describe '#can_use_services?' do
    it 'returns true' do
      teacher = Teacher.new('Math', 30, 'James')
      expect(teacher.can_use_services?).to eq(true)
    end
  end

  describe '#to_h' do
    it 'returns a hash with teacher information' do
      teacher = Teacher.new('Math', 30, 'James')
      expected_hash = {
        type: 'Teacher',
        id: teacher.id,
        name: 'James',
        age: 30,
        specialization: 'Math'
      }
      expect(teacher.to_h).to eq(expected_hash)
    end
  end
end
