class Node
  attr_accessor :value, :next_node

  def initialize(value = nil)
    @value = value
    @next_node = nil
  end

  def to_s
    @value
  end
end

class LinkedList

  def initialize
    @head = nil
    @tail = nil
    @size = 0
  end

  def append(value)
    new_node = Node.new(value)
  
    if @head.nil?
      @head = new_node
      @tail = new_node
    else
      @tail.next_node = new_node
      @tail = new_node
    end
    @size += 1
  end

  def prepend(value)
    new_node = Node.new(value)

    if @head.nil?
      @head = new_node
      @tail = new_node
    else
      new_node.next_node = @head
      @head = new_node
    end
    @size += 1
  end

  def size
    @size
  end

  def head
    @head
  end

  def tail
    @tail
  end

  def at(index)
    return nil if index.negative? || index >= @size

    current_node = @head
    index.times { current_node = current_node.next_node }
    current_node
  end

  def pop
    return if @size.zero?

    if @size == 1
      @head == nil
      @tail == nil
    else
      new_tail = at(@size - 2)
      new_tail.next_node = nil
      @tail = new_tail
    end
    @size -=1
  end

  def contains?(value)
    current_node = @head
    until current_node.nil?
      return true if current_node.value == value

      current_node = current_node.next_node
    end
    false
  end

  def find(value)
    current_node = @head
    index = 0
    until current_node.nil?
      return index if current_node.value == value

      current_node = current_node.next_node
      index += 1
    end
    nil
  end
  
  def to_s
    current_node = @head
  string = ""
    until current_node.nil?
    string += "( #{current_node.value} ) -> "
      current_node = current_node.next_node
    end
  string += "nil"
  end

  def insert_at(value, index)
    if index <= 0
      prepend(value)
    elsif index >= @size
      append(value)
    else
      new_node = Node.new(value)
      prev_node = at(index - 1)
      new_node.next_node = prev_node.next_node
      prev_node.next_node = new_node
      @size += 1
    end
  end
end

list = LinkedList.new

list.append('dog')
list.prepend('cat')
list.append('parrot')
list.prepend('hamster')
list.append('snake')
list.prepend('turtle')

puts list
puts list.size
puts list.head
puts list.tail
puts list.at(3)
puts list.pop
puts list

puts list.contains?('cat')
puts list.contains?('bat')

puts list.find('hamster')
puts list.find('zebra')
puts list

puts list.insert_at('zebra', 2)
puts list
