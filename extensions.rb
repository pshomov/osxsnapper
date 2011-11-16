module OSX
  class CIImage      
    def save(target, format = OSX::NSJPEGFileType, properties = nil)
      bitmapRep = OSX::NSBitmapImageRep.alloc.initWithCIImage(self)
      blob = bitmapRep.representationUsingType_properties(format, properties)
      blob.writeToFile_atomically(target, false)
    end

    def cgimage
      OSX::NSBitmapImageRep.alloc.initWithCIImage(self).CGImage()
    end

    def self.from(filepath)
      raise Errno::ENOENT, "No such file or directory - #{filepath}" unless File.exists?(filepath)
      OSX::CIImage.imageWithContentsOfURL(OSX::NSURL.fileURLWithPath(filepath))
    end
  end
end