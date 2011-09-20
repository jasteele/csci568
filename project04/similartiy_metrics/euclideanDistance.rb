# Euclidean distance function.
# Returns the linear distance between two objects this and that, represented as
# a floating point value between 0 and 1.
# Passing in arrays of values
module EuclideanDistance 
  def EuclideanDistance.euclideanDistance(this,that)
    # make sure that the arrays are same length (same # of attributes)
    if this.length == that.length
      sum = 0
      # for each dimension calculate the distance between this and that
      this.each_with_index do |x,index|
        sum += (x - that[index])**2
      end
      distance = Math.sqrt(sum)
      1 / (1 + distance)
    else
      puts "Arrays of differing length provided"
      return nil
    end
  end
end