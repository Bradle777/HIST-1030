# XPath Excercise 1
+ Hamlet, like a typical Shakespearean tragedy, contains five acts, each of which contains scenes. Both acts and 
  scenes are encoded as division `<div>` elements.

  + How can XPath tell them apart? XPath can tell them apart by the hierarchy. div of scenes is a child of div for acts,
    so you can specify whether you are looking for the parent div or the child div.  
  + What XPath would find just the acts? `/TEI/text/body/div`
  + What XPath would find just the scenes? `/TEI/text/body/div/div`
  + What XPath would find just the scenes in Act III? `//body/div[@xml:id="sha-ham3"]/div`

+ Stage directions `<stage>` occur in a variety of contexts.
  + What XPath would find all of the stage directions that are inside a metrical line `<l>`. How many are there? `//l//stage` There are 128.
  + What XPath would find all of the stage directions that are directly inside a speech `<sp>`, that is, inside a speech but not 
    inside a line within a speech? `//sp/stage`
  + What XPath would find all of the stage directions that are not directly inside a speech or a line. How many are there? `//stage[not(parent::l or parent::sp)]` -The right way. I thought that this would find all parents of the stage elements except for sp and l, but the output
    never really worked, turning out the same 264 values for total number of stage elements.
  + For the stage directions you identified in #2c, above, write an XPath expression that will return not the `<stage>` elements 
    themselves, but their parent elements, whatever they might be. What are those parent elements?  `//parent::stage` based on W3 schools this should work but I keep getting the same 264 stage elements output.
