class MaxIntSet
  attr_reader :max

  def initialize(max)
    @max = max
    @store = Array.new(max) { Array.new }
  end

  def insert(num)
    is_valid?(num)
    @store[num - 1] = num
  end

  def remove(num)
    @store[num - 1] = nil
  end

  def include?(num)
    @store.include?(num)
  end

  private

  def is_valid?(num)
    return false unless num.is_a?(Integer)
    raise "Out of bounds" if num > max || num < 0
    true
  end

  def validate!(num)
  end
end


class IntSet

  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
  end

  def insert(num)
    self[num] << num
  end

  def remove(num)
    raise "no num found" unless include?(num)
    self[num].delete(num)
  end

  def include?(num)
    self[num].include?(num)
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
    @store[(num % num_buckets) - 1]
  end

  def num_buckets
    @store.length
  end
end

class ResizingIntSet
  attr_reader :count

  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(num)
    return if include?(num)
    self[num] << num
    @count += 1
    resize! if @count == num_buckets
  end

  def remove(num)
    self[num].delete(num) if include?(num)
  end

  def include?(num)
    self[num].include?(num)
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
    @store[(num % num_buckets) - 1]
  end

  def num_buckets
    @store.length
  end

  def resize!
    temp = @store.flatten
    @store = Array.new(num_buckets * 2) { Array.new }
    @count = 0
    temp.each do |num|
      self.insert(num)
    end
  end
end