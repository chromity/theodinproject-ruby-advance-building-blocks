module MyEnumerable
  def my_each
    for element in self
     yield(element)
    end

    self
  end

  def my_each_with_index
    index = 0
    for element in self
      yield(index, element)
      index += 1
    end

    self
  end

  def my_select
    arr = []

    self.my_each do |element|
      arr << element if yield(element)
    end

    arr
  end


  def my_all?
    all = true

    self.my_each {|element| all = false if !yield(element)}

    all
  end

  def my_any?
    any = false

    self.my_each {|element| any = true if yield(element)}

    any
  end

  def my_none?
    none = true

    self.my_each{|element| none = false if yield(element)}

    none
  end

  def my_count
    count = 0

    self.my_each do |element|
      if block_given?
        count += 1 if yield(element) == true
      else
        count += 1
      end
    end

    count
  end

  def my_map(proc = nil)
    mapped = []

    if proc && proc.class = proc
      self.my_each do |element|
        mapped.push(proc.call(element))
      end
    else
      self.my_each do |element|
        mapped.push(yield(element))
      end
    end

    mapped
  end

  def my_inject(value = 0)
    value ||= 0

    self.my_each do |element|
      value = yield(value, element)
      puts "#{value} <- value #{element} <- element"
    end

    value
  end
end

include MyEnumerable
