class Array
  
# IMPORTANT to understand that...
# All Enumerable methods build upon .each, combining it with yield
# For each method, I used e.g. map2 to stop Ruby getting confused with actual map from Array class
# The alternative would be to build a fake class and module

  def map2() 
    output = []
    if block_given?
      self.each { |num| output << yield(num)}
    else
      output = to_enum :map
    end

    output # returns final result
  end

  def select2()
    output = []
    if block_given?
      self.each { |num| output << num if yield(num) }
    else
      output = to_enum :select
    end

    output
  end

  def each2()
    if block_given?
      for number in self
        yield number
      end
    else
      to_enum :each
    end
  end

  def reduce2(symbol_or_value=nil) 
  # according to Ruby docs, takes either a symbol or value before block
  # need to set default value of nil to prevent wrong no. of arguments error in rspec

    # first set up the value of the accumulator
    case symbol_or_value

    # convert things like reduce(:+) into reduce { |s,e| s + e }
    # .send is a method that allows you to invoke another method
    when Symbol then return reduce2 { |s,e| s.send(symbol_or_value, e) }
    when nil then acc = nil
    else acc = symbol_or_value
    end

    self.each do |num|
      if acc.nil?
        acc = num # starting point for 1st iteration
      else
        # yield to the block provided with the array and execute the block
        acc = yield(acc, num) # next point for 2nd iteration
      end
    end

    return acc 
  end

=begin
  def attr_accessor2(*args)
 
    # iterate through each passed in argument...
    args.each do |arg|
 
        # types out the getter
        self.class_eval("def #{arg};@#{arg};end")
 
        # types out the setter
        self.class_eval("def #{arg}=(val);@#{arg}=val;end")
 
    end
  end
=end

end
