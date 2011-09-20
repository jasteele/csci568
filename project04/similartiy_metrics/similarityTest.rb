# poor man's tests for similarity metrics

require 'euclideanDistance.rb'
require 'SMC.rb'
require 'jaccard.rb'
require 'pearson.rb'
require 'cosine.rb'

puts "Begin Poor Man's Testing"

puts "EuclideanDistance.euclideanDistance([1,2,3], [2, 4, 6]) = #{EuclideanDistance.euclideanDistance([1,2,3], [2, 4, 6])}"
puts "SMC.smc([1,0,0,0,0,0,0,0,0,0],[0,0,0,0,0,0,1,0,0,1]) = #{SMC.smc([1,0,0,0,0,0,0,0,0,0],[0,0,0,0,0,0,1,0,0,1])}"
puts "Jaccard.jaccard([1,0,0,0,0,0,0,0,0,0],[0,0,0,0,0,0,1,0,0,1]) = #{Jaccard.jaccard([1,0,0,0,0,0,0,0,0,0],[0,0,0,0,0,0,1,0,0,1])}"
puts "Pearson.pearson([1,2,3],[2,4,6]) = #{Pearson.pearson([1,2,3],[2,4,6])}"
puts "Cosine.cosine([3,2,0,5,0,0,0,2,0,0],[1,0,0,0,0,0,0,1,0,2]) = #{Cosine.cosine([3,2,0,5,0,0,0,2,0,0],[1,0,0,0,0,0,0,1,0,2])}"