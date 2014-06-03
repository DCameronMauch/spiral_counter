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

  context 'increment called twenty four times' do
    it 'returns a two digit spiral' do
      24.times { subject.increment }
      expect(subject.to_s).to eq("20 21 22 23 24\n19  6  7  8  9\n18  5  0  1 10\n17  4  3  2 11\n16 15 14 13 12")
    end
  end
end
