class Fixnum
  # Fixnum#hash already implemented for you
end

class Array
  def hash
    return 0 if self.empty?
    sum = 0

    self.each_with_index do |el, i|
      sum ^= el.hash + i.hash
    end

    sum
  end
end

class String
  def hash
    return 0 if self.empty?

    temp = self.split("").map(&:ord)
    temp.hash

  end
end

class Hash
  # This returns 0 because rspec will break if it returns nil
  # Make sure to implement an actual Hash#hash method
  def hash
    return 0 if self.empty?
    temp = self.to_a
    temp.sort!
    temp.hash
  end
end
