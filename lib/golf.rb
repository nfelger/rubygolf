class Golf
  class << self
    def hole1 a
      a.inject :*
    end
    
    def hole2 s
      s.split.sort_by { |a| a[1] }.join ' '
    end
    
    def hole3 n
      hole1(1..n)
    end
  
    def hole4 a
      a.map { |e|
        e.sub(/man.(\w*)/, 'hat(man(\1)').
          sub(/(dog.\w*)/, '\1(bone)').
          sub(/cat/, 'dead')
      }
    end

    def hole5 b
      s = b.size-1
      (0..s).map {|n|
        (0..s-n).map{|m| b[m..m+n]}
      }.flatten(1)
    end
    
    def hole6 n
      (1..n).map {|i|
        s = "#{'fizz' if i % 3 == 0}#{'buzz' if i % 5 == 0}"
        s == '' ? i : s
      }
    end
    
    def hole7 l
      r = [c = [l.shift]]
      l.each do |i|
        if i == (c[-1] || 0) + 1
          c[1] = i
        else
          r << c = [i]
        end
      end
      r.map { |s| s.join '-' }
    end
    
    def hole8 n
      l = [1, 1]
      3.upto(n) { |i|
        l << l[i - 2] + l[i - 3]
      }
      l
    end
    
    def hole9 f
      r = File.readlines f
      e = []
      loop {
        v = Hash.new(0)
        r.each {|s| v[(s.gsub(/ |\n/, "").split(",") - e)[0]] += 1}
        x = v.sort_by &:last
        tc  = x[-1][0]
        tcv = x[-1][-1]
        bc  = x[0][0]
        return tc if tcv > r.length / 2
        bc ? e << bc : (return tc)
      }
    end
  end
end
