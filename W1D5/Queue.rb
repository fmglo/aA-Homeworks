class Queue

  def initialize
    @array = []
  end

  def enqueue(el)
    @array.unshift(el)
  end

  def dequeue
    @array.pop
  end

  def peek
    @array[-1]
  end
  private

  attr_reader :array

end
