# This class is used to create an interface between a telemetry
# .bin file and cosmos
# author Travis Pollock
require 'cosmos/interfaces/stream_interface'
require 'fileutils'
include FileUtils

  module Cosmos
  #implements the interface class
  class FileInterface  < StreamInterface

    def initialize inDir, outDir
	  #super("burst")
	  #SETUP FOR UHF
	  super("Fixed", [75 ,13 , "0x4B49374E5555004B", true, false, false, nil])
	  #SETUP FOR SBAND
	  #super("Fixed", [21, 0, "0x0C01", true, false, false, nil])
	  #super()
      #initializes a few fields
      @inpDir = inDir + "/"
      @outDir = outDir + "/"
      @isConnected = false
	  @buffer = ""

    end

    #opens file if exists
    def connect
      super()

      #if there's anything in the input directory then allow connect otherwise return
      if(Dir.glob("#{@inpDir}/**.bin") != nil)
        @isConnected = true
      end
    end

    #checks for connection to file
    def connected?
      return @isConnected
    end

    #closes the File
    def disconnect
      super
      @isConnected = false;

    end

    #returns the contents of the File
    def read_interface

      #blocks while directory is empty
      while true
        if (!@buffer.empty? || (Dir.glob("#{@inpDir}/**.bin").shift != nil))
          break
        end
      end

	  if(!@buffer.empty?)
		  log = File.new("log.txt", "a")
		  log.write(@buffer.slice(0))
		  sleep(0.2)
      	return @buffer.slice!(0)
	  end

	  inpFileName = Dir.glob("#{@inpDir}/**.bin").shift
      inpFile = File.new(inpFileName, "rb")

      #creates file names for moving file
      outFileName = @outDir + File.basename(inpFileName)
      inpFileName = @inpDir + File.basename(inpFileName)

      #reads input file
      @buffer = inpFile.read
      inpFile.close

      #moves file
      FileUtils.mv(inpFileName, outFileName)

      log = File.new("log.txt", "a")
	  log.write(@buffer.slice(0))
      return @buffer.slice!(0)
    end

    #method should not be called there is no need to write back
    def write_interface
      puts "WE NEVER LEFT HIS SHONIES! I REPEAT WE NEVER LEFT HIS SHONIES!\n"
    end
  end
end

#  inter = FileInterface.new 'testing.txt'
#  inter.connect
#  puts inter.read_interface
#  inter.disconnect
