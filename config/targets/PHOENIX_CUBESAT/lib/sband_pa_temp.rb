require 'cosmos/conversions/conversion'
module Cosmos
	class SbandPaTemp < Conversion
		def initialize
			super()
		end
		def call(value, packet, buffer)
			case value
			when 0
				ret = 24
			when 1
				ret = 26
			when 2
				ret = 28
			when 3
				ret = 30
			else
			 	ret = 30
			end
		end
	end
end
