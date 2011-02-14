package org.hamcrest.collection
{
	import org.hamcrest.Matcher;
import org.hamcrest.WrapUtil;

/**
	 * Matches if the item being matched is in the given Array.
	 * 
	 * @see org.hamcrest.collection.InArrayMatcher
	 * @see org.hamcrest.collection#array
	 * 
	 * @example
	 * <listing version="3.0">
	 * 	assertThat(3, inArray([1, 2, 3]));
	 * </listing>
	 * 
	 * @author Drew Bourne
	 */
	public function inArray(...rest):Matcher
	{
		var matchers:Array = rest;
        
        if (rest.length == 1 && rest[0] is Array)
        {
            matchers = rest[0];
        }
        
        WrapUtil.wrapList(matchers);
        return new InArrayMatcher(matchers);
    }
}