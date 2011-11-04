load 'neuron.rb'
load 'layer.rb'
class Network
	attr_accessor :layers, :input, :expected_output, :output
	def initialize
		@layers = []
		# input
		@layers[0] = Layer.new(3)
		# hidden
		@layers[1] = Layer.new(2)
		# output
		@layers[2] = Layer.new(3)
		@input = [1, 0.25, -0.5]
		@expected_output = [1, -1, 0]
	end
end