require 'cosmos/conversions/conversion'
module Cosmos
	class SbandPaVoltage < Conversion
		def initialize
			super()
		end
		def call(value, packet, buffer)
			value * 4 * 10e-3
		end
	end
end
