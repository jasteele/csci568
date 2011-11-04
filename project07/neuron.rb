
class Neuron
	attr_accessor :weight
	def initialize
		# a random weight between 0 and 1
		@weight = rand
		#randomly make some negative weights too
		if (rand > 0.5)
			@weight *= -1
		end
	end
end