require 'cosmos/conversions/conversion'
module Cosmos
	class SbandBatteryVoltage < Conversion
		def initialize
			super()
		end
		def call(value, packet, buffer)
			return value * 4 * 10e-3
		end
	end
end
