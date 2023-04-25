require "byebug"
class Integer
  # Integer#hash already implemented for you
end

class Array
  def hash
    hashed_array = ""
    self.each do |ele|
      hashed_array += ele.to_s
    end 
    
    hashed_array.to_i
    
  end
end

class String

  def hash
  alpha = ('a'..'z').to_a
  string = self
  new_string = []
  # debugger
    string.each_char.with_index do |char, i|
    index = (alpha.index(char.downcase))
      new_string << index
    end
    new_string
  end
end

class Hash
  # This returns 0 because rspec will break if it returns nil
  # Make sure to implement an actual Hash#hash method
  def hash
    0
  end
end