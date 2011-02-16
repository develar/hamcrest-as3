package org.hamcrest {
[Abstract]
public class EventMatcher implements Matcher {
  private var matcher:Matcher;
  protected var item:Object;
  
  public function EventMatcher(matcher:Matcher) {
    this.matcher = matcher;
  }

  public function describeTo(description:Description):void {
    matcher.describeTo(description);
  }

  public function matches(item:Object):Boolean {
    this.item = item;
    setState();
    var result:Boolean = matcher.matches(item);
    resetState();
    this.item = null;
    return result;
  }

  protected function setState():void {
  }

  protected function resetState():void {
  }

  public function describeMismatch(item:Object, mismatchDescription:Description):void {
    matcher.describeMismatch(item, mismatchDescription);
  }
}
}
