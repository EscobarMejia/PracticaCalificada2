class BinaryTree
  include Enumerable

  attr_accessor :value, :left, :right

  def initialize(value)
    @value = value
    @left = nil
    @right = nil
  end

  def <<(element)
    if element <= @value
      @left.nil? ? @left = BinaryTree.new(element) : @left <<(element)
    else
      @right.nil? ? @right = BinaryTree.new(element) : @right <<(element)
    end
  end

  def empty?
    @left.nil? && @right.nil?
  end

  def each(&block)
    @left.each(&block) if @left
    block.call(@value)
    @right.each(&block) if @right
  end

  def include?(element)
    return true if element == @value
    if element < @value
      return @left.include?(element) if @left
    else
      return @right.include?(element) if @right
    end
    false
  end

  def all?(&block)
    return false unless block.call(@value)
    left_result = @left.nil? ? true : @left.all?(&block)
    right_result = @right.nil? ? true : @right.all?(&block)
    left_result && right_result
  end

  def any?(&block)
    return true if block.call(@value)
    left_result = @left.nil? ? false : @left.any?(&block)
    right_result = @right.nil? ? false : @right.any?(&block)
    left_result || right_result
  end

  def sort
    sorted_elements = []
    each { |element| sorted_elements << element }
    sorted_elements.sort
  end
end

tree = BinaryTree.new(5)
tree << 3
tree << 7
tree << 2
tree << 4
tree << 6
tree << 8

# Comprobar si el árbol contiene un elemento
puts tree.include?(3)
puts tree.include?(9)

# Comprobar si todos los elementos cumplen una condición
puts tree.all? { |element| element < 10 }
puts tree.all? { |element| element < 5 }

# Comprobar si algún elemento cumple una condición
puts tree.any? { |element| element > 8 }
puts tree.any? { |element| element > 10 }

# Ordenar los elementos del árbol
sorted_elements = tree.sort
puts sorted_elements.inspect
