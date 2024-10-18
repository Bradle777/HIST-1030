# XPath 3
What XPath expression will select the last stage direction `<stage>` in the entire 
document?
+ `//body/div[last()]//div[last()]/sp[last()]/l[last()]/stage[last()]`

What XPath expression will find the last member in the cast list at the beginning 
of the document and select the @xml:id attribute that is associated with it?
+ `//castList/castItem[last()]//@xml:id`

What XPath expression will select all `<sp>` elements with more than 8 line `<l>` 
subelements (which may be children or deeper descendants)? You’ll need to use the 
count() function (Kay 733–34).
+ `//sp[descendant::l[8]]`

Building on your answer to the preceding question, what XPath expression will tell
you how many line subelements each of those speeches actually has?
+ `//sp[descendant::l[8]]/count(l)`

Building on your answers to the preceding two questions, what XPath expression 
will find the speakers of all speeches that have more than 8 line subelements? 
Once you’ve found the speeches that have more than 8 lines, you can find the 
speakers of those speeches by just adding another path step, but you’ll get some 
duplication, since a single person may have more than one long speech. Your answer 
to this question should get rid of the duplicates, and return just a list of names 
of speakers without duplication. You’ll need to use the distinct-values() function (Kay 749–50).
+ `distinct-values(//sp[l[8]]/speaker)`

**Optional bonus questions: I will come back to later, for my own challenge**

Reference Question #1.What XPath would find the 
last line `<l>` in the play? What XPath would find the last stage direction or line 
(that is, whichever of the last stage direction and last line comes last)? You’ll
need to use the union operator (Kay 628–31).
+ Blah

Reference Question #2. What’s the 
difference between an XPath that returns the @xml:id attribute itself and an XPath 
that returns just the value of the @xml:id attribute? That is, what are the two 
XPath expressions and what does each of them return? You’ll need to use the data()
or string() function (Kay 741–43, 877–79).
+ Blah

Reference Question #3. What XPath expressions would select speeches with more than 8 line child elements (one 
XPath expression) and speeches with more than 8 descendant line elements (the 
expression you created for #3, above)? How do those results differ? If there are 
descendant line elements that are not children of a speech, what XPath expression 
will return the element names of their parents? You’ll need to use the name() 
function (Kay 835–37).
+ Blah