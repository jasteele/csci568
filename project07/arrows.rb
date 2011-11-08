class Arrow
	attr_accessor :weight, :destination, :source
	def initialize (source, destination)
		#random between 0 and 1
		@weight = rand.round(2)
		#randomly make some negative weights too
		if (rand > 0.5)
			@weight *= -1
		end
		source.arrows.push(self)
		@source = source
		@destination = destination
	end
end