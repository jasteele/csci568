load 'neuron.rb'
load 'layer.rb'
load 'arrows.rb'
class Network
	attr_accessor :layers, :input, :expected_output, :output
	def initialize

		@layers = []
		# output
		@layers[2] = Layer.new(3, nil)
		# hidden
		@layers[1] = Layer.new(2, @layers[2])
		# input
		@layers[0] = Layer.new(3, @layers[1])
		@input = [1, 0.25, -0.5]
		@expected_output = [1, -1, 0]
		
		# initialize input layer
		@layers[0].neurons[0].value = @input[0]
		@layers[0].neurons[1].value = @input[1]
		@layers[0].neurons[2].value = @input[2]
	end
	# create arrows between nodes
	def connect_layers(source, destination)
		destination.neurons.each do |dest_n|
			source.neurons.each do |src_n|
				src_n.arrows.push(Arrow.new(src_n, dest_n))
			end
		end
	end

	# run ANN
	def feed_forward(layer)

	end
end