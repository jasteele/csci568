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

	def reset
		# clear the node values to prepare network for another run
		@layers.each do |layer|
			if (@layers[0] != layer)
				layer.neurons.each do |neuron|
					neuron.value = 0.0
				end
			end
		end
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
				# if not in the input layer then tanh the node value (the sum of the previous nodes * weights) 
				if (layer != @layers[0])
					neuron.value = Math.tanh(neuron.value)
				end
				neuron.arrows.each do |arrow|
					arrow.destination.value += neuron.value * arrow.weight
				end

			end
		end
		puts "Outputs - "
		puts @layers[2].neurons[0].value
		puts @layers[2].neurons[1].value
		puts @layers[2].neurons[2].value
		# train
		train()
	end

	def train
		output = []
		output[0] = @layers[2].neurons[0].value
		output[1] = @layers[2].neurons[1].value
		output[2] = @layers[2].neurons[2].value
		while ((@expected_output[0] - output[0]).abs > 0.01 || (@expected_output[1] - output[1]).abs || 0.01 && (@expected_output[2] - output[2]).abs || 0.01)
			backpropagate
			reset
			feed_forward
		end
	end

	# gave up on figuring out the worksheets backpropagation and I am now implementing the method from CI
	def backpropagate
		# calculate output errors
		output_error = []
		@layers[2].neurons.each_with_index do |neuron, index|
			error = @expected_output[index] - neuron.value
			output_error[index] = dtanh(neuron.value) * error
		end

		# calculate hidden errors
		hidden_error = []
		@layers[1].neurons.each_with_index do |neuron, index|
			error = 0.0
			index_helper = 0
			neuron.arrows.each do |arrow|
				error = error + output_error[index_helper] * arrow.weight
				index_helper += 1
			end
			hidden_error[index] = dtanh(neuron.value) * error
		end

		#update arrow weights going to outputs
		@layers[1].neurons.each do |neuron|
			neuron.arrows.each_with_index do |arrow, i|
				change = output_error[i] * neuron.value
				arrow.weight = arrow.weight + change
			end
		end
		
		#update arrow weights going to hidden layer
		@layers[0].neurons.each do |neuron|
			neuron.arrows.each_with_index do |arrow, i|
				change = hidden_error[i] * neuron.value
				arrow.weight = arrow.weight + change
			end
		end

	end

	def dtanh(x)
		return 1.0-x*x
	end
end