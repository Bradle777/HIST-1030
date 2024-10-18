# XPath Assignment 2

Most (not all) speeches in Hamlet contain, as their immediate children, mostly 
metrical line `<l>` and anonymous block `<ab>` elements (an anonymous block is the 
TEI element that the tagger used to represent a non-metrical speech line). Speeches 
also typically contain, as immediate child elements, `<speaker>` elements, and may also 
contain stage directions `<stage>`. We have deliberately left out at least one other 
type of subelement found as an immediate child of speech elements. 
Based on this understanding:

What XPath would find all of the speeches that do not contain any metrical lines as 
immediate children? How many are there?
+ `//sp[not(descendant::l)]` There are 432.

What XPath would find all of the speeches that do not contain either any metrical 
lines `<l>` or any anonymous blocks `<ab>` as immediate children? 
How many are there? What do they contain instead?
  + `//sp[not(child::ab or child::l)]` There are 7.
  + They contain the element `<lg>` which stands for line group.
 
Explain why the following four XPath expressions return two different results, 
and describe in prose what each of them does return, and why:
+ `//sp[@who="Hamlet"]/l[1]`
  + This XPath expression returns the first line of all speeches by Hamlet. Verbally, it finds all speech elements with the attribute value for who as Hamlet, and returns the first line element of each. This is because the l has a [1] predicate after it.
+ `/descendant::sp[@who="Hamlet"]/l[1]`
  +This XPath expression returns the same results as the first one. It is the same because speech is a descendant of the overall file, following proper hierarchy. It has the same Hamlet attribute value and the predicate [1] returns only the first line.
+ `(//sp[@who="Hamlet"]/l)[1]`
  + This XPath expression returns the line of the very first speech by Hamlet in the play. This happens because the expression to find the lines of all speeches by Hamlet is in parentheses and has a [1] after it, returning only the first one that occurs.
+ `(/descendant::sp[@who="Hamlet"]/l)[1]`
  + This is returns the same results as the expression above. The instead of using `//` it uses `/descendant::` which allows the path to be followed equivalently.