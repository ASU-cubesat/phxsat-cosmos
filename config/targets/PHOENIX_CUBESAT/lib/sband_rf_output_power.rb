require 'cosmos/conversions/conversion'
module Cosmos
	class SbandRfOutputPower < Conversion
		def initialize
			super()
		end
		def call(value, packet, buffer)
			value.to_f * 3 / 4096 * 28 / 18
		end
	end
end
