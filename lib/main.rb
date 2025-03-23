class Node
  attr_accessor :data, :next_node

  def initialize(data)
    @data = data
    @next_node = nil
  end
end

class LinkedList
  attr_accessor :head, :tail

  def initialize
    @head = nil
    @tail = nil
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
  end

  def to_s
    current_node = @head
    nodes = []
    while current_node
      nodes << "( #{current_node.data} )"
      current_node = current_node.next_node
    end
    "#{nodes.join(' -> ')} -> nil" 
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
