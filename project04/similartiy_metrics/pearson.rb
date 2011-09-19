# Pearson Correlation Coefficient
# 

def pearson(this, that)
  # make sure that the arrays are same length (same # of attributes)
  if this.length == that.length
    n = this.length
    # sum the arrays
    sum1=this.inject(:+)
    sum2=that.inject(:+)
    # Sum up the squares
    sum1Sq=this.inject(0){|sum, n| sum + n**2 }
    sum2Sq=that.inject(0){|sum, n| sum + n**2 }
    # Sum up the products
    pSum=0
    this.each_with_index do |x,index|
      pSum += x * that[index]
    end
    puts pSum
    
    # Calculate Pearson score
    num=pSum -((sum1*sum2)/n)
    den=Math.sqrt((sum1Sq-sum1**2/n)*(sum2Sq-sum2**2/n))
    if den==0 
      return 0
    end
    r=num/den
  else
    puts "Arrays of differing length provided"
    return nil
  end
end