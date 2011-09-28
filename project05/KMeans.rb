class KMeans
  attr_accessor :k

  def initialize(k)
    @k = k
    @allpoints = []
  end
  
  def load(fileName)
    entries = []
    data = File.open(fileName, "r")
    data.each_line("\n") do |row|
      columns = row.split(",")
      if columns.length == 5
        @allpoints.push(Iris.new(columns[0],columns[1],columns[2],columns[3]))
      end
    end
  end   
end

class Cluster
  attr_accessor :location, :points
  
  def initialize(location)
    @location = location
    @points = []
  end

  def move!

  end
end

# class to hold the csv data from the file
class Iris
  attr_accessor :a, :b, :c, :d
  
  def initialize(a,b,c,d)
    @a = a
    @b = b
    @c = c
    @d = d
  end

  def to_s
    puts "#{@a}, #{@b}, #{@c}, #{@d}"
  end


end