class Arrow
	attr_accessor :weight,:source, :destination
	def inititalize (source, destination)
		#random between 0 and 1
		@weight = rand
		#randomly make some negative weights too
		if (rand > 0.5)
			@weight *= -1
		end
		@source = source
		@destination = destination
	end
end