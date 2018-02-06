require 'cosmos/conversions/conversion'
module Cosmos
	class UhfBootCause < Conversion
		def initialize
			super()
		end
		def call(value, packet, buffer)
			value
		end
	end
end
