# Simple Matching Coeficient 
# Distance between binary attributes counting presence and absence
module SMC
  def SMC.smc(this,that)
    # make sure that the arrays are same length (same # of attributes)
    if this.length == that.length
      number_of_matches = 0
      this.each_with_index do |x, index|
        # if the attribute in this matched the attribute 
        # in that (0 OR 1) then increase the number of matches 
        if x == that[index]
          number_of_matches += 1.0
        end  
      end
      similarity = number_of_matches / this.length
    else
      puts "Arrays of differing length provided"
      return nil
    end
  end
end