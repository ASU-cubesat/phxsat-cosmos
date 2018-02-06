require 'cosmos/conversions/conversion'
module Cosmos
	class SbandPaCurrent < Conversion
		def initialize
			super()
		end
		def call(value, packet, buffer)
			return value * 40 * 10e-6
		end
	end
end
