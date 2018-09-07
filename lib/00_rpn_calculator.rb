class RPNCalculator
  # TODO: your code goes here!
  def initialize
    @store = []
    @idx = 0
    @total = 0
  end

  def push(num)
    @store.push(num)
    @idx += 1
  end

  def plus
    if @idx == 1
      @total += @store[0]
    else
      @total += @store[@idx-2...@idx].reduce(:+)
    end
    @idx = 1
  end

  def minus
    if @idx == 1
      @total -= @store[0]
    else
      @total += @store[@idx-2...@idx].reduce(:-)
    end
    @idx = 1
  end






  

  def value
    @total    
  end
end
