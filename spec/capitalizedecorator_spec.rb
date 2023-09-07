require '../capitalizedecorator'

describe CapitalizeDecorator do
  let(:nameable) { double('Nameable') }
  subject(:decorator) { described_class.new(nameable) }

  describe '#correct_name' do
    it 'capitalizes a given name' do
      allow(nameable).to receive(:correct_name).and_return('jane')
      expect(decorator.correct_name).to eq('Jane')
    end
  end
end
