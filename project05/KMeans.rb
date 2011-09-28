#Jared Steele's KMeans implementation for the iris dataset
class KMeans
  attr_accessor :k

  def initialize(k)
    @k = k
    @allPoints = []
    @allClusters
    @maxs = [0,0,0,0]
  end
  
  def kmeans
    # create K clusters
    (1..@k).each do |i|
      
    end
  end


  def load(fileName)
    data = File.open(fileName, "r")
    data.each_line("\n") do |row|
      columns = row.split(",")
      if columns.length == 5
        @maxs.each_with_index do |max,index|
          if max < columns[index].to_f
            @maxs[index] = columns[index].to_f
          end
        end
        @allPoints.push([columns[0],columns[1],columns[2],columns[3]])
      end
    end
  end   
end

#Cluster class is an object to represent each centroid and its cluster
class Cluster
  attr_accessor :location, :points
  
  def initialize(location)
    @location = location
    @points = []
    @distanceMoved = 10
  end

  def move!
    a = b = c = d = 0
    oldLocation = @location
    @points.each do |iris|
      a += iris[0]
      b += iris[1]
      c += iris[2]
      d += iris[3]
    end

    a /= points.length
    b /= points.length
    c /= points.length
    d /= points.length

    @location = [a,b,c,d]
    @distanceMoved = EuclideanDistance.euclideanDistance(oldLocation, @location)
  end
end


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
      #1 / (1 + distance)
    else
      puts "Arrays of differing length provided"
      return nil
    end
  end
end