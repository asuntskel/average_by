module Enumerable(T)
  def average_by(& : T -> U) : Float64 forall U
    count, sum = average_by_internal { |value| yield value }
    raise Enumerable::EmptyError.new unless count > 0
    sum.to_f64 / count
  end
  def average_by?(& : T -> U) : Float64? forall U
    count, sum = average_by_internal { |value| yield value }
    if count > 0
      sum.to_f64 / count
    else
      nil
    end
  end
  private def average_by_internal(& : T -> U) forall U
    sum = 0
    count = 0
    each do |elem|
      value = yield elem
      if v = value
        sum += v.to_f64
        count += 1
      end
    end
    {count, sum}
  end
end
