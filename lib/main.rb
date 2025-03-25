class Node
  attr_accessor :data, :next_node

  def initialize(data)
    @data = data
    @next_node = nil
  end

  def to_s
    @data
  end
end

class LinkedList

  def initialize
    @head = nil
    @tail = nil
    @size = 0
  end

  def append(data)
    new_node = Node.new(data)
  
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

  def to_s
    current_node = @head
  string = ""
    until current_node.nil?
    string += "( #{current_node.data} ) -> "
      current_node = current_node.next_node
    end
  string += "nil"
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
