require 'cosmos/conversions/conversion'
module Cosmos
	class SbandStatus < Conversion
		def initialize
			super()
		end
		def call(value, packet, buffer)
			case value
			when 0
				ret = "NOTXL&PWRBAD"
			when 1
				ret = "TXL&PWRBAD"
			when 2
				ret = "NOTXL&PWRGOOD"
			when 3
				ret = "TXL&PWRGOOD"
			else
				ret = "404"
		 	end
		end
	end
end
