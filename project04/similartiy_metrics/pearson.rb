# Pearson Correlation Coefficient
# 

def pearson(this, that)
  # make sure that the arrays are same length (same # of attributes)
  if this.length == that.length
    num = covariance(this, that)
    den = standard_deviation(this) * standard_deviation(that)
    if den==0 
      return 0
    end
    return num / den
  else
    puts "Arrays of differing length provided"
    return nil
  end
end

def covariance (x,y)
  sumx=x.inject(:+)
  sumy=y.inject(:+)
  meanx = Float(sumx) / x.size
  meany = Float(sumy) / y.size
  psum = 0.0
  x.each_with_index do |x_value, index|
    psum += (x_value - meanx) * (y[index] - meany)
  end
  return(1.0 / (x.size - 1)) * psum
end

def standard_deviation (x)
  sumx=x.inject(:+)
  meanx = Float(sumx) / x.size
  psum = 0.0
  x.each do |value| 
    psum += (value - meanx)**2 
  end
  Math.sqrt((1.0 / (x.size - 1)) * psum)
end