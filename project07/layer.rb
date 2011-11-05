class Layer
	attr_accessor :neurons, :forward_layer
	def initialize(numNeurons, forward_layer)
		@neurons = []
		(0...numNeurons).each do |index|
			@neurons[index] = Neuron.new
		end
		@forward_layer = forward_layer
	end

end