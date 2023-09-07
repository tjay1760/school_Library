require_relative '../person'
describe Person do
  describe '#can_use_services' do
    context 'Person is of age' do
      it 'can use services' do
        person = Person.new(50, 'Java', 'John')
        expect(person.can_use_services?).to be true
      end
    end

    context 'Person is underage but has parent permission' do
      it 'returns true' do
        person = Person.new(14, 'C', 'Luka', parent_permission: true)
        expect(person.can_use_services?).to be true
      end
    end

    context 'when the person is under 18 and does not have parent permission' do
      it 'returns false' do
        person = Person.new(1, 'Math', 'modric', parent_permission: false)
        expect(person.can_use_services?).to be false
      end
    end
  end
end
