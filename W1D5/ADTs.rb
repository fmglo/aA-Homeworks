class Stack
  def initialize
    @array = []
  end

  def push(el)
    @array << el
  end

  def pop
    @array.pop
  end

  def peek
    @array[-1]
  end
  
  private

attr_reader :array

end
