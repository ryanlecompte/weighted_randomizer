# Implements weighted randomization for a group of weighted items.
# This class expects a hash of key -> value pairs where the value is
# the weight for the item.
#
# @example Usage
#  wr = WeightedRandomizer.new('queue1' => 25, 'queue2' => 100, 'queue3' => 2)
#  puts "Using queue #{wr.sample}"
#
# @note Mostly adapted from recipe 5.11 from the Ruby Cookbook.
class WeightedRandomizer
  VERSION = '0.1.2'

  # Creates a new instance.
  #
  # @param [Hash] items the weighted items (key item, value weight)
  # @return [WeightedRandomizer]
  def initialize(items)
    @items = normalize(items)
  end

  # Returns one or more weighted random values.
  #
  # @param [Integer] num the number of samples to return
  # @return [Object, Array<Object>] one or more sampled items
  def sample(num = nil)
    return _sample unless num
    Array.new(num) { _sample }
  end

  private

  # Returns a single weighted random value.
  #
  # @return [Object] the weighted item
  def _sample
    pick = rand
    @items.each do |key, weight|
      return key if pick <= weight
      pick -= weight
    end
    nil
  end

  # Normalizes the weights to float values so that
  # arbitrary integer/float weights can be specified.
  #
  # @param [Hash] items the weighted items (key item, value weight)
  # @return [Hash] the items with their weights normalized
  def normalize(items)
    normalized = {}
    sum = items.values.inject(0.0, :+)
    items.each do |key, weight|
      normalized[key] = weight / sum
    end

    normalized
  end
end
