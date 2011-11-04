class Layer
	attr_accessor :neurons, :forward_layer
	def initialize(numNeurons)
		(0..numNeurons).each do |index|
			@neurons[index] = new Neuron()
		end
	end

end