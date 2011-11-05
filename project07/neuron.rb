
class Neuron
	attr_accessor :weights, :value
	def initialize (num_wieghts)
		# array of random weights between -1 and 1
		@weights = []
		(0...num_weights).each do |index|
			@weight[index] = rand
			#randomly make some negative weights too
			if (rand > 0.5)
				@weight *= -1
			end
		end

		# initialize value to null
		@value = null

	end
end