package org.hamcrest.collection {
import flash.display.DisplayObjectContainer;

/**
 * Converts an Array-like Object to an Array.
 *
 * @param iterable Object
 * @returns Array
 */
internal function toArray(iterable:Object):Object {
  if ("iterator" in iterable) {
    return iterable.iterator;
  }
  else if (iterable is Vector || iterable is Array) {
    return iterable;
  }

  var n:int;
  var i:int;
  var result:Array;
  if ("getChildAt" in iterable) {
    var o:DisplayObjectContainer = DisplayObjectContainer(iterable);
    n = o.numChildren;
    result = new Array(n);
    for (i = 0; i < n; i++) {
      result[i] = o.getChildAt(i);
    }
  }
  else if ("getElementAt" in iterable) {
    n = iterable.numElements;
    result = new Array(n);
    for (i = 0; i < n; i++) {
      result[i] = iterable.getElementAt(i);
    }
  }
  else {
    result = [];
    for each (var item:Object in iterable) {
      result[result.length] = item;
    }
  }

  return result;
}
}
