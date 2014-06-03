require_relative 'spiral_counter'

describe SpiralCounter do
  context 'increment never called' do
    it 'returns single digit spiral' do
      expect(subject.to_s).to eq('0')
    end
  end

  context 'increment called eight times' do
    it 'returns a two digit spiral' do
      8.times { subject.increment }
      expect(subject.to_s).to eq("6 7 8\n5 0 1\n4 3 2")
    end
  end
end
