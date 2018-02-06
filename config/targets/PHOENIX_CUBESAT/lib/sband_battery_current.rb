require 'cosmos/conversions/conversion'
module Cosmos
	class SbandBatteryCurrent < Conversion
		def initialize
			super()
		end

		def call(value, packet, buffer)
			puts value
			x = 40
			y = 10e-6
			value = value * x * y
		end
	end
end
