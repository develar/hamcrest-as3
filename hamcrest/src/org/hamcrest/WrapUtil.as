package org.hamcrest {
import org.hamcrest.collection.array;
import org.hamcrest.collection.emptyArray;
import org.hamcrest.object.HasPropertiesMatcher;
import org.hamcrest.object.IsEqualMatcher;

public final class WrapUtil {
  public static function wrapList(list:Array):void {
    var n:uint = list.length;
    for (var i:int = 0; i < n; i++) {
      var item:Object = list[i];
      if (!(item is Matcher)) {
        list[i] = wrap(item);
      }
    }
  }

  public static function wrap(value:Object):Matcher {
    if (value != null && value.constructor === Object) {
      return new HasPropertiesMatcher(value);
    }
    else if (value is Array) {
      return value.length == 0 ? emptyArray() : array(value);
    }
    else {
      return new IsEqualMatcher(value);
    }
  }
}
}
