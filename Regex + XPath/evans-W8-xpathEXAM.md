# XPath Exam
### Part 1
1.Define nodes, sequences and atomic values. Give an example of how each of those 
concepts might arise when you use XPath to explore Hamlet in oXygen. 
+ A node is a single element within an XML file. This could be an element, attribute, text, etc. `<sp>` is a node in the Hamlet file.
+ A sequence is an ordered collection of items, nodes or atomic values, and the order is based on the the location in the XML file. `//sp` would produce a sequence of nodes in the entire Hamlet file.
+ An atomic value is a just a type of data, a string, integer, time, date, etc. `//l =>count()` would return an integer atomic value for the number of `<l>` elements in Hamlet.
  

2.What is the difference between an axis and a predicate in a path expression? 
To answer this question, give an example of each within an XPath expression, 
explain how they are distinguished syntactically, and explain what each contributes 
to the overall meaning of the XPath expression you use to illustrate them.
 + An axis would be `//lg/parent::sp`. An axis defines the hierarchy of the file, finding the descendants, children, parents, ancestors of an element. This expression finds the `<sp>` elements that have `<lg>` as children.
 + A predicate would be `//sp[@who="Horatio"]`. A predicate filters out elements who don't match the criteria of the predicate. This predicate finds only speeches by Horatio, removing any other speeches by other people.
 
3.Explain the difference between the simple map operator ! and the arrow operator 
=>. For example, consider the two expressions `//sp ! count(.)` and `//sp => count()`
and how they return different results. Give one example each of a reasonable way you 
might use these operators to explore Hamlet.
 + In the first expression the ! applies the count function individually to every instance of `<sp>`,
   while in the second expression the => applies the count function to the entire expression.
   this means that the first expression returns a lot of single integers, while the second expression returns one large integer.
 + Using the arrow operator `//sp[@who="Hamlet"]=>count()` this would count the number of Hamlet speeches.
   Using the simple map operator `//lg ! count(.)` this would assign the integer 1 to all the instances of `<lg>`.

### Part 2
1.What XPath expression will select the lines that don’t have @n attributes? (Hint: There are five such lines.)
+ `//l[not(@n)]`

2.What XPath expression will tell you how many such lines there are? Your expression must return a single integer value.
+ `//l[not(@n)] => count()`

3.What XPath expression finds the scenes where Ghost is featured as a speaker? (Hint: There are 2 such scenes.)
+ `//sp[@who="ham-ghost."]/parent::div`

4.What XPath expression finds all speeches spoken by Ghost? 
Your XPath expression must select the speeches themselves. (Hint: there are 14 such speeches.)
+ `//sp[@who="ham-ghost."]`

5.What XPath expression will find every line (`<l>` or `<ab>` element) in which the name
Hamlet is spoken? Your XPath expression must include only lines where 
the name Hamlet is spoken within speech. (Hint: there are 77 such lines, 10 instances of `<l>` and 67 of `<ab>`.)
+ `//(l | ab)[text()[contains(.,"Hamlet")]]` Source: [Stack Overflow Forum](https://stackoverflow.com/questions/3655549/xpath-containstext-some-string-doesnt-work-when-used-with-node-with-more)


6.What XPath expression will return the speakers of each speech that contains a 
line (`<l>` or `<ab>` element) that mentions Hamlet? (Hint: There are 68 such 
speakers because some speeches contain more than one line that mentions Hamlet.)
+ `//(l | ab)[text()[contains(.,"Hamlet")]]/preceding-sibling::speaker`

7.What expression would deduplicate the results of the last expression? 
In other words, you should return a sequence of strings where each name is 
listed only once. (Hint: There are 13 such speaker names.)
+ `//(l | ab)[text()[contains(.,"Hamlet")]]/preceding-sibling::speaker => distinct-values()`

8.What XPath expression will sort the sequence in alphabetical order?
+ `//(l | ab)[text()[contains(.,"Hamlet")]]/preceding-sibling::speaker => distinct-values() => sort()`

9.What Xpath expression will return the sequence as a comma-separated list?
+ `string-join(//(l | ab)[text()[contains(.,"Hamlet")]]/preceding-sibling::speaker => distinct-values() => sort() , ",")`

### Part 3
1.What XPath expression will return a deduplicated list of all element names
within the document? (Hint: Use the name() function. There are 28 distinct element names.)
+ `//name()=>distinct-values()` This returns 29, but one of them is blank, which I am not sure why that is happening.

2.What XPath expression will select all speech elements that have both `<l> and <ab>` 
children? (Hint: There are 7 such speeches.)
+ `//l[preceding-sibling::ab | following-sibling::ab]/parent::sp`

3.What XPath expression will return the ratio of `<l>` to `<ab>` children for each 
of the speeches selected in the previous step and sort them from lowest to highest? 
(Hint: There are 7 such ratios, ranging from a low of 0.117 to a high of 6)
+ `//l[preceding-sibling::ab | following-sibling::ab]/parent::sp/(count(l[preceding-sibling::ab | following-sibling::ab]) div count(ab[preceding-sibling::l | following-sibling::l]))`

4.Given the 7 values in the preceding question, what XPath expressions will return 
just the lowest value,just the highest value, and just the average (arithmetic mean) 
of all 7 values?
+ Just the highest value:`//l[preceding-sibling::ab | following-sibling::ab]/parent::sp/(count(l[preceding-sibling::ab | following-sibling::ab]) div count(ab[preceding-sibling::l | following-sibling::l])) => max()`
+ Just the lowest value:`//l[preceding-sibling::ab | following-sibling::ab]/parent::sp/(count(l[preceding-sibling::ab | following-sibling::ab]) div count(ab[preceding-sibling::l | following-sibling::l])) => min()`
+ Just the average value: `//l[preceding-sibling::ab | following-sibling::ab]/parent::sp/(count(l[preceding-sibling::ab | following-sibling::ab]) div count(ab[preceding-sibling::l | following-sibling::l])) => avg()'
