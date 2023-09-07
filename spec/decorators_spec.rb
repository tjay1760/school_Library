require_relative '../basedecorator.rb'
describe BaseDecorator do
  let(:nameable) { double('Nameable') }
  subject(:decorator) { described_class.new(nameable) }
  describe '#decorator' do
    it 'assigns the decorator object' do
      expect(decorator.instance_variable_get(:@nameable)).to eq(nameable)
    end
  end

  describe '#correct_name' do
    it 'delegates to the nameable object' do
      expect(nameable).to receive(:correct_name).and_return('The coder')
      expect(decorator.correct_name).to eq('The coder')
    end
  end
end
