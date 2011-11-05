class Layer
	attr_accessor :neurons, :forward_layer
	def initialize(numNeurons, forward_layer)
		@forward_layer = forward_layer
		@neurons = []
		(0...numNeurons).each do |index|
			@neurons[index] = Neuron.new(0)
		end
	end
end