require 'cosmos/conversions/conversion'
module Cosmos
	class SbandBoardTempTop < Conversion
		def initialize
			super()
		end
		def call(value, packet, buffer)
			return value * 0.0625
		end
	end
end
