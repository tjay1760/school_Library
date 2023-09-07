require '../trimmerdecorator'

describe TrimmerDecorator do
  let(:nameable) { double('Nameable', correct_name: 'Long Name Here') }
  subject(:decorator) { described_class.new(nameable) }

  describe '#correct_name' do
    context 'when the name is longer than 10 characters' do
      it 'trims the name to a maximum of 10 characters' do
        expect(decorator.correct_name).to eq('Long Name ')
      end
    end

    context 'when the name is 10 characters or shorter' do
      let(:nameable) { double('Nameable', correct_name: 'Short Name') }

      it 'does not trim the name' do
        expect(decorator.correct_name).to eq('Short Name')
      end
    end

    context 'when the name is exactly 10 characters' do
      let(:nameable) { double('Nameable', correct_name: 'ExactlyTen') }

      it 'does not trim the name' do
        expect(decorator.correct_name).to eq('ExactlyTen')
      end
    end


    context 'when the name is an empty string' do
      let(:nameable) { double('Nameable', correct_name: '') }

      it 'returns an empty string' do
        expect(decorator.correct_name).to eq('')
      end
    end
  end
end
