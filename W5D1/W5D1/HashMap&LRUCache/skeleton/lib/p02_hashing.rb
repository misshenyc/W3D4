class Integer
  # Integer#hash already implemented for you

end

class Array
  def hash
    hash = 0
    self.each_with_index do |char,i|
      hash += char.hash*i.hash
    end
    hash
  end
end

class String
  def hash
    hash = 0
    arr = self.split("")
    arr.each_with_index do |char,i|
      hash += char.ord.hash*i.hash
    end
    hash
  end
end

class Hash
  # This returns 0 because rspec will break if it returns nil
  # Make sure to implement an actual Hash#hash method
  def hash
    hash = 0
    arr = self.to_a
    sorted = arr.map { |sub| sub.hash }.sort
    sorted.each_with_index do |ele,i|
      hash += ele.ord.hash * i.hash
    end
    hash
  end
end
