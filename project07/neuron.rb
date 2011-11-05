class Neuron
	attr_accessor  :value, :arrows
	def initialize (value)
		# initialize value
		@value = value
		@arrows = []
	end
end