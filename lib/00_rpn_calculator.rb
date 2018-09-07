class RPNCalculator
  # TODO: your code goes here!
  def initialize
    @store = []
    @push_count = 0
    @total = 0
  end

  def push(num)    
    @push_count += 1
    if @push_count == 2 && @store.length > 2
      @store = [@total, @store[-1]]
      @total = 0
    end
    @store.push(num)
  end

  def plus
    if @store.length == 0
      raise "calculator is empty"
    elsif @push_count == 0
      @total += @store[0]
    else
      @total += @store[-2..-1].reduce(:+)
    end
    @push_count = 0
  end

  def minus
    if @store.length == 0
      raise "calculator is empty"
    elsif @push_count == 0
      @total -= @store[0]
    else
      @total += @store[-2..-1].reduce(:-)
    end
    @push_count = 0
  end

  def times
    if @store.length == 0
      raise "calculator is empty"
    elsif @push_count == 0
      @total *= @store[0].to_f
    else
      @total = @total + @store[-2..-1].reduce(:*)
    end
    @push_count = 0
  end

  def divide
    if @store.length == 0
      raise "calculator is empty"
    elsif @push_count == 0
      @total = @store[0].to_f / @total.to_f
    else
      @total += @store[-2..-1].reduce{|a,c| a.to_f / c.to_f}
    end
    @push_count = 0
  end

  def tokens(str)
    str.split.map do |el|
      if "*/+-".include? el
        el.to_sym
      else
        el.to_i
      end
    end
  end

  def evaluate(str)
    tokens(str).each do |el|
      plus if el == :+
      minus if el == :-
      times if el == :*
      divide if el == :/
      push(el) if el == el.to_s.to_i
    end
    x = @total * 1
    @store = []
    @push_count = 0
    @total = 0
    x
  end




  def value
    @total    
  end
end
