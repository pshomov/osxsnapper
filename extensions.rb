  class CIImage      
    def save(target, format = NSJPEGFileType, properties = nil)
      bitmapRep = NSBitmapImageRep.alloc.initWithCIImage(self)
      blob = bitmapRep.representationUsingType(format, properties:{NSImageProgressive => true, NSImageCompressionFactor => 0.3})
      blob.writeToFile(target, atomically:true)
    end
  end
