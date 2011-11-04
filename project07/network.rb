class Network
	attr_accessor :layers, :input, :expected_output, :output
	def initialize
		# input
		@layers[0] = new Layer(3)
		# hidden
		@layers[1] = new Layer(2)
		# output
		@layers[2] = new Layer(3)
		@input = [1, 0.25, -0.5]
		@expected_output = [1, -1, 0]
	end
end