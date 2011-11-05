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
		connect_layers(@layers[0],@layers[1])
		connect_layers(@layers[1],@layers[2])
	end

	# create arrows between neurons across layers
	def connect_layers(source, destination)
		source.neurons.each do |src_n|
			destination.neurons.each do |dest_n|
				Arrow.new(src_n, dest_n)
			end
		end
	end

	# run ANN
	def feed_forward
		@layers.each do |layer|
			layer.neurons.each do |neuron|
				neuron.arrows.each do |arrow|
					arrow.destination.value += neuron.value * arrow.weight
				end
			end
		end
		puts "Outputs - "
		puts @layers[2].neurons[0].value
		puts @layers[2].neurons[1].value
		puts @layers[2].neurons[2].value
	end
end