# Jaccard Coeficient 
# Very similiar to SMC except similarities between absent values are ignored (0)
# also known as asymettric data

def jaccard(this,that)
  # make sure that the arrays are same length (same # of attributes)
  if this.length == that.length
    number_of_matches = 0
    this.each_with_index do |x, index|
      # if the attribute in this matched the attribute 
      # in that then increase the number of matches
      # only if the value is one
      if x == 1 and that[index] == 1
        number_of_matches += 1.0
      end  
    end
    similarity = number_of_matches / this.length
  else
    puts "Arrays of differing length provided"
    return nil
  end

end