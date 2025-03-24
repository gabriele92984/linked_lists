class Node
  attr_accessor :data, :next_node

  def initialize(data)
    @data = data
    @next_node = nil
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
    node = Node.new(value)
    if @head.nil?
      @head = node
      @tail = node
    else
      node.next_node = @head
      @head = node
    end
    @size += 1
  end

  def to_s
    current = @head
    str = ""
    until current.nil?
      str += "( #{current.data} ) -> "
      current = current.next_node
    end
    str += "nil"
  end
end

list = LinkedList.new

list.append('dog')
list.append('cat')
list.append('parrot')
list.append('hamster')
list.append('snake')
list.append('turtle')

puts list
