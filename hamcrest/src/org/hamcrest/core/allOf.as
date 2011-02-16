package org.hamcrest.core {
import org.hamcrest.Matcher;
import org.hamcrest.WrapUtil;
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
public function allOf(... rest):Matcher {
  return new AllOfMatcher(WrapUtil.unwrapRest(rest));
}
}
