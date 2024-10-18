# XPath 4

1.What XPath will return a hyphen-separated list of all characters without duplicates. 
Our solution uses `string-join()` or `distinct-values()`).
+  `string-join(//castList//role/@xml:id , "-")` I used castList to ensure no duplicates without adding extra XPath to filter them out.

2.What XPath will return the number of `<l>` elements
that are middle parts? Our solution uses count() and contains().
+  `//l[contains(@xml:id , "M")] => count()`

3.What XPath finds all of the speeches by Rosencrantz, whether alone 
or together with Guildenstern? Our solution uses a single instance of contains().
+  `//sp[@who="Rosencrantz"  or @who="Rosencrantz Guildenstern"]`\
+ `//sp[contains(@who, "Rosencrantz")]`

4.Find the length of the longest speech. What length does it return? 
Our solution uses string-length() and max().
+  `//sp/string-length()=>max()` The length is 5248.
