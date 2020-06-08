
class MaxIntSet
  def initialize(max)
    @store = Array.new(max, false)
    @max = max
  end

  attr_accessor :max, :store

  def insert(num)
    if !num.between?(0,max)
      raise "Out of bounds"
    else
      store[num] = true 
    end
  end

  def remove(num)
    store[num] = false
  end

  def include?(num)
    store[num]
  end

  private

  def is_valid?(num)
  end

  def validate!(num)
  end
end


class IntSet
  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
  end
  attr_accessor :store

  def insert(num)
    return false if include?(num)
    self[num] << num
  end

  def remove(num)
    self[num].delete(num)
  end

  def include?(num)
    self[num].include?(num)
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
    self.store[num % num_buckets] 
  end

  def num_buckets
    @store.length
  end
end

require "byebug"
class ResizingIntSet
  attr_accessor :count, :store

  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(num)
    return false if include?(num)
    self[num] << num
    @count += 1
    if @count == num_buckets
      @count = 0 
      resize!
    end
  end

  def remove(num)
    return false if !include?(num)
    self[num].delete(num)
    @count -= 1
  end

  def include?(num)
    self[num].include?(num)
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
    self.store[num % num_buckets]
  end

  def num_buckets
    @store.length
  end
  

  def resize! 
  # debugger
    former_buckets = self.store 
    @store = Array.new(num_buckets*2) { Array.new } 
    former_buckets.each do |sub|
      sub.each do |ele|
         self.insert(ele)
      end
    end
  end

end
