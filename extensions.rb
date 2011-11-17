  class CIImage      
    def save(target, format = NSJPEGFileType, properties = nil)
      bitmapRep = NSBitmapImageRep.alloc.initWithCIImage(self)
      blob = bitmapRep.representationUsingType(format, properties:properties)
      blob.writeToFile(target, atomically:false)
    end

    def cgimage
      OSX::NSBitmapImageRep.alloc.initWithCIImage(self).CGImage()
    end

    def self.from(filepath)
      raise Errno::ENOENT, "No such file or directory - #{filepath}" unless File.exists?(filepath)
      OSX::CIImage.imageWithContentsOfURL(OSX::NSURL.fileURLWithPath(filepath))
    end
  end
