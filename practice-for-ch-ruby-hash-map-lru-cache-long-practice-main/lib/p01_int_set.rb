require 'byebug'
class MaxIntSet
  attr_reader :store
  def initialize(max)
    @store = Array.new(max, false)
    @max = max 
  end
 
  def insert(num)
    raise 'Out of bounds' if num > @max || num < 0 
    @store[num] = true 
  end

  def remove(num)
    @store[num] = false
  end

  def include?(num)
     if @store[num]
      return true 
     else 
      false 
     end 
  end

  private

  def is_valid?(num)
  end

  def validate!(num)
  end
end

class IntSet

  attr_reader :store

  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
  end

  def insert(num)
    mod_num = num % 20
    @store[mod_num] = true 
  end

  def remove(num)
    mod_num = num % 20
    @store[mod_num] = false
  end

  def include?(num)
    mod_num = num % 20 
    if @store[mod_num] == true 
      return true 
    else 
      return false 
    end 
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
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
    @num_buckets = num_buckets
  end

  def insert(num)
    mod_num = num % num_buckets
    if !@store[mod_num].include?(num)
      @store[mod_num] << num 
      @count += 1 
    end 
    if @count == num_buckets
      resize!
    end
  end

  def remove(num)
    mod_num = num % num_buckets
    if @store[mod_num].include?(num)
      @store[mod_num].delete(num) 
      @count -= 1 
    end  
  end

  def include?(num)
    mod_num = num % num_buckets
    @store[mod_num].include?(num)
  end

  private

  def num_buckets
    @store.length
  end

  def resize!
    # debugger
    new_bucket = self.num_buckets * 2
    old_store = @store 
    # p old_store
      @count = 0 
      @store = Array.new(new_bucket) {[]}
      # debugger
      old_store.flatten.each do |ele|
        self.insert(ele)
      end 

      @store

  
  end

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
  end
end