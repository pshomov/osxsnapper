  class CIImage      
    def save(target, format = NSJPEGFileType, properties = nil)
      bitmapRep = NSBitmapImageRep.alloc.initWithCIImage(self)
      blob = bitmapRep.representationUsingType(format, properties:properties)
      blob.writeToFile(target, atomically:true)
    end
  end
