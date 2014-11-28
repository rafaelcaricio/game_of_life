require File.join(File.dirname(__FILE__), "..", "spec_helper")

describe Position do
  let (:position) { Position.new(2, 2) }

  describe 'it is possible to get' do
    it 'from key' do
      expect(Position.from(position.key)).to eq(position)
    end
  end
end
