require 'cosmos/conversions/conversion'
module Cosmos
	class UhfBootCause < Conversion
		def initialize(multiplier)
			super()
		end
		def call(value, packet, buffer)

			return value
		end
	end
end
