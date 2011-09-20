# Cosine Similarity
#
module Cosine
  def Cosine.cosine(this,that)
    # make sure that the arrays are same length (same # of attributes)
    if this.length == that.length
      # Sum up the squares
      sum1Sq=this.inject(0){|sum, n| sum + n**2 }
      sum2Sq=that.inject(0){|sum, n| sum + n**2 }
      vector_length_x = sum1Sq**0.5
      vector_length_y = sum2Sq**0.5
      # Sum up the products
      pSum=0.0
      this.each_with_index do |x,index|
        pSum += x * that[index]
      end
      similarity = pSum / (vector_length_x * vector_length_y)
    else
      puts "Arrays of differing length provided"
      return nil
    end
  end
end