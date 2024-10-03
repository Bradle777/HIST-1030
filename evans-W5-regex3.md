# Regex Assignment 3

**Step 1: Reserved Characters**

First find `&` and replace it with `&amp;`. Then find `<` and replace it with `&lt;`.

This text should not have any of those except for the intial xml at the very top.

**Step 2: Double Lines**

Remove double lines that are not informative or helpful.

Find `\n{3,}` and replace it with `\n\n`.

**Step 3: Intro Matter**

Copy everything before the title `FIRST ACT` and paste into another saved document for future manual tagging of title, author, character, etc.

**Step 4: Italics**

Find `_\._` and repace it with `\.`, where dot does not match all. 
For magazines find `_([A-Z].+)_` where dot does not match all and case sensitive is checked and replace it with `<title>\1</title>`. 
For other instances find `_(.+)_` and where dot does not match all and replace it with `<emph>\1</emph>`.

**Step 5: Stage Directions**
 
Find `\[(.+?)\]` where dot matches all and replace it with `<stage>\1</stage>`.

**Step 6: Act and Scene Titles**

Find `^\n[^a-z\n]+$\n\n` and replace it with `\n` to remove the extra ACT DROP, SCENE, TABLEAU titles.
Then find `^\n([^a-z\n]+$)\n\n` and replace it with `\n<act>\1</act>\n` to tag FIRST ACT, SECOND ACT, etc.

**Step 7: Setting**

Find `(</act>)(.+?)(<stage>)` where dot matches all and replace it with `\1<setting>\2</setting>\3`.

**Step 8: Speakers and Speech**

To tag each speaker find `^[^a-z\n]+$` and replace it with `<speaker>\0</speaker>`.
Find `(</speaker>)(.+?)(<speaker>)` where dot matches all and replace it with `\1\n<text>\2</text>\n\n\3` then tag the last one manually.
Find `<speaker>.+?</text>` where dot matches all and replace it with `<sp>\0</sp>`.

**Step 9: Clean up**

Add a root element to the whole thing. `<play> </play>` and then press pretty print.