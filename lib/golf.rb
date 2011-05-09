class Golf
  def self.hole2 s
    s.split(' ').sort { |a,b| a[1] <=> b[1] }.join ' '
  end
  
  def self.hole3(n)
    n == 1 ? 1 : n*hole3(n-1)
  end
  
  def self.hole7(ints)
    ranges = []
    ints.each do |int|
      found = false
      ranges = ranges.map do |range|
        if int == range.begin - 1
          found = true
          (range.begin - 1)..(range.end)
        elsif int == range.end + 1
          found = true
          (range.begin)..(range.end + 1)
        else
          range
        end
      end
      ranges << (int..int) unless found
    end
    ranges.map do |range|
      if range.begin == range.end
        range.begin.to_s
      else
        "#{range.begin}-#{range.end}"
      end
    end
  end
  
  def self.hole6(n)
    (1..n).map{|i|
      s = "#{'fizz' if i % 3 == 0}#{'buzz' if i % 5 == 0}"
      s == '' ? i : s
    }
  end
end
