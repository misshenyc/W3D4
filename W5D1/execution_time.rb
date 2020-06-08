def my_min1(arr)

    (0...arr.length).each do |i1|
        min = true
        (i1+1...arr.length).each do |i2|
            min = false if arr[i1] > arr[i2]
        end
        return arr[i1] if min
    end
    
end

# list = [ 0, 3, 5, 4, -5, 10, 1, 90 ]
# p my_min1(list)  # =>  -5
# time complexity: O(n^2)

def my_min2(arr)
    min = arr.first
    arr.each do |ele|
        min = ele if ele < min 
    end
    min
end

# list = [ 0, 3, 5, 4, -5, 10, 1, 90 ]
# p my_min2(list)  # =>  -5
# time complexity: O(n)

def largest_contiguous_subsum1(list)
    subs = []
    (0...list.length).each do |i1|
        (i1...list.length).each do |i2|
            subs << list[i1..i2]
        end
    end
    subs.map {|sub|sub.sum}.max
end

# list = [5, 3, -7]
# p largest_contiguous_subsum1(list) # => 8
# list = [2, 3, -6, 7, -6, 7]
# p largest_contiguous_subsum1(list)
# list = [-5, -1, -3]
# p largest_contiguous_subsum1(list)
# time complexity: O(n^2)


def largest_contiguous_subsum2(list)
    large_sum = list.first
    current_sum = list.first
    (1...list.length).each do |i|
        current_sum = 0 if current_sum < 0
        current_sum += list[i]
        large_sum = current_sum if current_sum > large_sum
    end
    large_sum
end

# list = [5, 3, -7]
# p largest_contiguous_subsum2(list) # => 8
# list = [2, 3, -6, 7, -6, 7]
# p largest_contiguous_subsum2(list)
# list = [-5, -1, -3]
# p largest_contiguous_subsum2(list)
#time complexity: O(n)


def anagram1?(str1, str2)
    perm = str1.split("").permutation.to_a
    anagrams = perm.map {|ana|ana.join("")}
    anagrams.include?(str2)
end

# p anagram1?("gizmo", "sally")    #=> false
# p anagram1?("elvis", "lives")    #=> true
#time complexity: O(n!)

def anagram2?(str1, str2)
    chars = str2.split("")
    str1.each_char do |char|
        i = chars.index(char)
        chars.delete_at(i) unless i.nil?
    end
    chars.empty?
end

# p anagram2?("gizmo", "sally")    #=> false
# p anagram2?("elvis", "lives")    #=> true
#time complexity: O(n)

def anagram3?(str1, str2)
    str1.split("").sort == str2.split("").sort
end


# p anagram3?("gizmo", "sally")    #=> false
# p anagram3?("elvis", "lives")    #=> true
#time complexity: O(nlogn)



def anagram4?(str1, str2)
    hash(str1) == hash(str2)
end

def hash(str)
    hash = Hash.new(0)
    str.each_char {|char| hash[char] += 1}
    hash
end

# p anagram4?("gizmo", "sally")    #=> false
# p anagram4?("elvis", "lives")    #=> true
#time complexity: O(n)

time_start= Time.now
def bad_two_sum?(arr, target)
    combos = arr.combination(2).to_a
    sums = combos.map{|com| com.sum}
    sums.include?(target)
end
time_end = Time.now

arr = [0, 1, 5, 7]
# p bad_two_sum?(arr, 6) # => should be true
# p bad_two_sum?(arr, 10) # => should be false
#time complexity: O(n^2)

# p time_end - time_start


def okay_two_sum?(arr, target)
    sorted = arr.sort
    sorted.each.with_index do |ele,i|
        return true if arr[i+1..-1].include?(target - ele)
    end
    false
end

# def bsearch(arr, target)
#     return false if arr.empty?
#     mid = arr.length/2
#     if arr[mid] == target
#         return true
#     elsif arr[mid] < target
#         return bsearch(arr.drop(mid+1),target)
#     else 
#         return bsearch(arr.take(mid),target) 
#     end
    
# end

arr = [0, 1, 5, 7]
# p okay_two_sum?(arr, 6) # => should be true
# p okay_two_sum?(arr, 10) # => should be false
#time complexity: O(n^2)


def two_sums?(arr, target)
    hash = {}
    arr.each do |ele|
        hash[ele] = target - ele
    end
    hash.each{|k,v| return true if hash.values.include?(k) && k!=v}
    false
end

arr = [0, 1, 5, 7]
# p two_sums?(arr, 6)
# p two_sums?(arr, 10)
#time complexity: O(1)


def windowed_max_range(arr, w)
    current_max_range = 0
    (0...arr.length).each do |i|
        diff = arr[i...i+w].max - arr[i...i+w].min
        current_max_range = diff if diff > current_max_range 
    end
    current_max_range
end

# p windowed_max_range([1, 0, 2, 5, 4, 8], 2) == 4 # 4, 8
# p windowed_max_range([1, 0, 2, 5, 4, 8], 3) == 5 # 0, 2, 5
# p windowed_max_range([1, 0, 2, 5, 4, 8], 4) == 6 # 2, 5, 4, 8
# p windowed_max_range([1, 3, 2, 5, 4, 8], 5) == 6 # 3, 2, 5, 4, 8
# time complexity: O(n^2)

class MyQueue
    def initialize
        @store = []
    end

    def peek
        @store.first
    end

    def size
        @store.size
    end

    def empty?
        @store.empty?
    end

    def enqueue(ele)
        @store.push(ele)
    end

    def dequeue(ele)
        @store.shift(ele)
    end

end

class MyStack
    def initialize
        @store = []
    end
    def initialize
        @store = []
    end

    def peek
        @store.last
    end

    def size
        @store.size
    end

    def empty?
        @store.empty?
    end

    def pop(ele)
        @store.pop(ele)
    end

    def push(ele)
        @store.push(ele)
    end
end

window = MyQueue.new


def windowed_max_range2(arr, w)
    (0..arr.length - w).each do |i|
        window = arr[i..i+w-1]
    end
end


# p windowed_max_range([1, 0, 2, 5, 4, 8], 2) == 4 # 4, 8
# p windowed_max_range([1, 0, 2, 5, 4, 8], 3) == 5 # 0, 2, 5
# p windowed_max_range([1, 0, 2, 5, 4, 8], 4) == 6 # 2, 5, 4, 8
# p windowed_max_range([1, 3, 2, 5, 4, 8], 5) == 6 # 3, 2, 5, 4, 8












