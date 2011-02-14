package org.hamcrest.core
{
    import org.hamcrest.Matcher;
import org.hamcrest.collection.array;
import org.hamcrest.collection.emptyArray;
import org.hamcrest.object.HasPropertiesMatcher;

/**
     * Checks if an item matches all of the given Matchers.
     *
     * @param ...rest Matcher instances
     *
     * @see org.hamcrest.core.AllOfMatcher
     *
     * @example
     * <listing version="3.0">
     *  assertThat("good", allOf(equalTo("good"), not(equalTo("bad"))));
     * </listing>
     *
     * @author Drew Bourne
     */
    public function allOf(... rest):Matcher
    {
        var matchers:Array = rest;

        if (rest.length == 1 && rest[0] is Array)
        {
            matchers = rest[0];
        }

      var n:uint = matchers.length;
      for (var i:int = 0; i < n; i++) {
        var item:Object = matchers[i];
        if (item is Matcher) {
        }
        else if (item is Array) {
          matchers[i] = item.length == 0 ? emptyArray() : array(item);
        }
        else {
          matchers[i] = new HasPropertiesMatcher(item);
        }
      }

        return new AllOfMatcher(matchers);
    }
}
