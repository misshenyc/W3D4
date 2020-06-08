class HashSet
  attr_reader :count
  attr_accessor :store

  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(key)
    return false if include?(key)
    self[key] << key
    @count += 1
    if @count == num_buckets
      @count = 0 
      resize!
    end
  end

  def include?(key)
    self[key].include?(key)
  end

  def remove(key)
    return false if !include?(key)
    self[key].delete(key)
    @count -= 1
  end

  private

  def [](num)
    self.store[num.hash % num_buckets]
    # optional but useful; return the bucket corresponding to `num`
  end

  def num_buckets
    @store.length
  end

  def resize!
    former_buckets = self.store 
    @store = Array.new(num_buckets*2) { Array.new } 
    former_buckets.each do |sub|
      sub.each do |ele|
         self.insert(ele)
      end
    end
  end
end
