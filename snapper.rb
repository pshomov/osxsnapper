framework 'Cocoa'
require 'extensions'
require 'time'

class Screen
  def self.capture
    screenshot = CGWindowListCreateImage(CGRectInfinite, KCGWindowListOptionOnScreenOnly, KCGNullWindowID, KCGWindowImageDefault)
    image = CIImage.imageWithCGImage(screenshot)
    CGImageRelease screenshot
    image
  end
end

while(true)
  sleep(15.0)
  begin
    idletime = CGEventSourceSecondsSinceLastEventType(1,NX_KEYDOWN | NX_LMOUSEDOWN | NX_LMOUSEUP | NX_RMOUSEDOWN | NX_RMOUSEUP | NX_MOUSEMOVED | NX_LMOUSEDRAGGED | NX_RMOUSEDRAGGED | NX_KEYDOWN | NX_KEYUP | NX_FLAGSCHANGED | NX_SCROLLWHEELMOVED)
    if (idletime < 60)  
      image = Screen.capture
      Dir::mkdir "#{Time.new.strftime("%Y%m%d")}" unless Dir::exists? "#{Time.new.strftime("%Y%m%d")}"
      image.save("#{Time.new.strftime("%Y%m%d")}/#{Time.new.strftime("%Y%m%d - %H:%M:%S")} - desktop.jpg") 
    end
  rescue Exception => e
    puts e.message
  end
end