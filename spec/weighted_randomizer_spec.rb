require 'spec_helper'

describe WeightedRandomizer do
  let(:items) { {:a => 2, :b => 5, :c => 53} }
  let(:randomizer) { WeightedRandomizer.new(items) }

  describe '#initialize' do
    it 'creates a new instance with normalized weighted items' do
      internal_items = randomizer.instance_variable_get(:@items)
      internal_items.keys.should =~ items.keys
      internal_items.values.inject(:+).should == 1.0
    end
  end

  describe '#sample' do
    it 'returns a single item by default' do
      randomizer.sample.should be_a(Symbol)
    end

    it 'returns an array of items with count specified' do
      randomizer.sample(5).should be_an(Array)
    end

    it 'respects weights' do
      result = randomizer.sample(1000).each_with_object(Hash.new(0)) { |i, h|
        h[i] += 1
      }
      result.max_by { |k, v| v }.first.should == :c
    end
  end
end
