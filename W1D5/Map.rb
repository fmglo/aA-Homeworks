class Map
  def initialize
    @array = []
  end
  def set(key, value)
    index = array.index { |subarr| subarr[0] == key }
    if index
      array[index][1] = value
    else
      array.push([key, value])
    end

    value
  end

  def get(key)
    array.each {|subarr| return subarr[1] if subarr[0] == key }
    nil
  end

  def delete(key)
    value = get(key)
    array.reject! { |subarr| subarr[0] == key }
    value
  end

  def show
    deep_dup(array)
  end

  private

  attr_reader :array

  def deep_dup(arr)
    arr.map { |el| el.is_a?(Array) ? deep_dup(el) : el }
  end
end
