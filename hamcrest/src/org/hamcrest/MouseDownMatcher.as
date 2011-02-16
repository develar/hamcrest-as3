package org.hamcrest {
import flash.events.MouseEvent;

public class MouseDownMatcher extends EventMatcher {
  public function MouseDownMatcher(matcher:Matcher) {
    super(matcher);
  }
  
  override protected function setState():void {
    item.dispatchEvent(new MouseEvent(MouseEvent.ROLL_OVER));
    item.dispatchEvent(new MouseEvent(MouseEvent.MOUSE_DOWN));
    item.validateNow();
  }
  
  override protected function resetState():void {
    item.dispatchEvent(new MouseEvent(MouseEvent.ROLL_OUT));
    item.dispatchEvent(new MouseEvent(MouseEvent.MOUSE_UP));
    item.validateNow();
  }
}
}
