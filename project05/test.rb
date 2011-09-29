#test for kmeans clustering

require 'KMeans.rb'

puts "Test for K means with 3 clusters and the iris dataset (data is in my .gitignore)"
a = KMeans.new(3)
a.load('iris.csv')
a.kmeans
