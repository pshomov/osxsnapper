require 'osx/cocoa'
require 'extensions'
require 'time'

class Screen
  def self.capture
    screenshot = OSX::CGWindowListCreateImage(OSX::CGRectInfinite, OSX::KCGWindowListOptionOnScreenOnly, OSX::KCGNullWindowID, OSX::KCGWindowImageDefault)
    OSX::CIImage.imageWithCGImage(screenshot)
  end
end

Screen.capture.save("#{Time.new.strftime("%Y%m%dT%H%M")} - desktop.jpg")