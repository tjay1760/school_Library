require_relative '../person.rb'
require_relative '../teacher.rb'
describe Teacher do
    describe "#initialize" do
        it "should create a new Teacher" do
            teacher = Teacher.new("Math", 30, "James")
            expect(teacher.specialization).to eq('Math')
      expect(teacher.age).to eq(30)
      expect(teacher.parent_permission).to eq(true)
      expect(teacher.name).to eq('James')
      expect(teacher.id).to be_a(Integer)
        end
    end
    describe '#can_use_services?' do
        it 'returns true' do
          teacher = Teacher.new('MAth', 30, "james")
          expect(teacher.can_use_services?).to eq(true)
        end
      end
end