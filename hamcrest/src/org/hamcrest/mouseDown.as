package org.hamcrest {
import org.hamcrest.core.AllOfMatcher;
import org.hamcrest.object.HasPropertiesMatcher;

public function mouseDown(... rest):Matcher {
  if (rest.length == 1) {
    return new MouseDownMatcher(WrapUtil.unwrap(rest[0]));
  }
  else if (rest.length == 2) {
    var first:Object = rest[0];
    var second:Object = rest[1];
    if (first.constructor === Object && second.constructor === Object) {
      for (var key:Object in first) {
        if (!(key in second)) {
          var v:Object = first[key];
          // optimize, reduce matchers instances if v is not Matcher (otherwise, double instance)
          var wrapped:Boolean = !(v is Matcher);
          var m:Matcher;
          if (wrapped) {
            m = WrapUtil.unwrap(v);
            first[key] = m;
          }
          else {
            m = Matcher(v);
          }
          
          second[key] = m;
        }
      }
      
      return new AllOfMatcher([new HasPropertiesMatcher(first), new MouseDownMatcher(new HasPropertiesMatcher(second))]);
    }
    else {
      throw new ArgumentError();
    }
  }
  else {
    throw new ArgumentError();
  }
}
}