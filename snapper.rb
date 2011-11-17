framework 'Cocoa'
require 'extensions'
require 'time'

class Screen
  def self.capture
    screenshot = CGWindowListCreateImage(CGRectInfinite, KCGWindowListOptionOnScreenOnly, KCGNullWindowID, KCGWindowImageDefault)
    CIImage.imageWithCGImage(screenshot)
  end
end

while(true)
  sleep(15.0)
  idletime = CGEventSourceSecondsSinceLastEventType(1,NX_KEYDOWN | NX_LMOUSEDOWN | NX_LMOUSEUP | NX_RMOUSEDOWN | NX_RMOUSEUP | NX_MOUSEMOVED | NX_LMOUSEDRAGGED | NX_RMOUSEDRAGGED | NX_KEYDOWN | NX_KEYUP | NX_FLAGSCHANGED | NX_SCROLLWHEELMOVED)
  if (idletime < 60)  
    Screen.capture.save("#{Time.new.strftime("%Y%m%dT%H%M%S")} - desktop.jpg") 
  end
end