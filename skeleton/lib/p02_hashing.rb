require 'byebug'
class Fixnum
  # Fixnum#hash already implemented for you
end

class Array
  def hash
    hash_str = 0

    self.each_with_index do |el, idx|
      hash_str += el.hash ^ idx.hash
    end

    hash_str
  end
end

class String
  def hash
    self.split("").map(&:ord).hash
  end
end

class Hash
  def hash
    hash_arr = []

    self.each do |key, val|
      hash_arr << [key.hash, val.hash].hash
    end


    hash_arr.sort.hash
  end
end
