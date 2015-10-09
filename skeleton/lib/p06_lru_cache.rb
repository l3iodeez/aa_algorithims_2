require_relative 'p05_hash_map'
require_relative 'p04_linked_list'

class LRUCache
  attr_reader :count
  def initialize(max, prc)
    @map = HashMap.new
    @store = LinkedList.new
    @max = max
    @prc = prc
  end

  def count
    @map.count
  end

  def get(key)
    if @map.include?(key)
      update_link!(@map[key])
      return @map[key].value
    else
      calc_value = @prc.call(key)
      eject! if count == @map.count
      @store.insert(key, calc_value)
      @map.set(key, @store.get(key))
      calc_value
    end
  end

  def to_s
    "Map: " + @map.to_s + "\n" + "Store: " + @store.to_s
  end

  private

  def calc!(key)
    # suggested helper method; insert an (un-cached) key
  end

  def update_link!(link)
    @store.each do |parent|
      parent.next = link.next if parent.next == link
      parent.next = link if parent.next.nil?
    end
    # suggested helper method; move a link to the end of the list
  end

  def eject!
    @map.delete(@store.first.key)
    @store.remove(@store.first)
  end
end
