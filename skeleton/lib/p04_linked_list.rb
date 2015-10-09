require "byebug"
class Link
  attr_accessor :key, :val, :next

  def initialize(key = nil, val = nil, nxt = nil)
    @key, @val, @next = key, val, nxt
  end

  def to_s
    "#{@key}, #{@val}"
  end
end

class LinkedList
  include Enumerable
  attr_reader :head


  def initialize
    @head = Link.new
  end

  def [](i)
    each_with_index { |link, j| return link if i == j }
    nil
  end

  def first
    head
  end

  def last

    # self.select { |link| link.next.nil? }.first
    return @head if head.next.nil?
    current_pos = @head
    until current_pos.next.nil?

     current_pos = current_pos.next
     return current_pos if current_pos.next.nil?
   end


  end

  def empty?
    head.key.nil?
  end

  def get(key)
    current_pos = @head
    return @head.val if current_pos.key == key
    until current_pos.next.nil?

     current_pos = current_pos.next
     return current_pos.val if current_pos.key == key
   end

   nil
 end


  def include?(key)
    current_pos = @head

    until current_pos.next.nil?

      return true if current_pos.key == key
      current_pos = current_pos.next
    end

    false
  end

  def insert(key, val)
    if empty?
      @head = Link.new(key, val, nil)
    else
      last.next = Link.new(key, val, nil)
    end
  end

  def remove(key)
    current_pos = @head
    @head = @head.next if !@head.nil? && @head.key == key
    until current_pos.next.nil?
      if current_pos.next.key == key
        current_pos.next = current_pos.next.next
      end
      current_pos = current_pos.next
    end

   nil
  end




  def each(&blk)
    current_pos = @head

    loop do
      break if current_pos.nil?
      blk.call(current_pos)
      break if current_pos.next.nil?
      current_pos = current_pos.next
    end


  end

  # uncomment when you have `each` working and `Enumerable` included
  def to_s
    inject([]) { |acc, link| acc << "[#{link.key}, #{link.val}]" }.join(", ")
  end
end
