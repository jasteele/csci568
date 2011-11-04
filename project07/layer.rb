class Layer
	attr_accessor :neurons, :forward_layer
	def initialize(numNeurons)
		@neurons = []
		(0...numNeurons).each do |index|
			@neurons[index] = Neuron.new
		end
	end

end