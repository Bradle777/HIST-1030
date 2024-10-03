# Regex Assignment 2

**Step 1: Reserved Characters**

Remove any reserved characters like & and < that would interfere with well-formedness.

First, find & and replace it with `&amp;`. Then find < and replace it with `&lt;`.

**Step 2: Double Lines**

Remove double lines that are not informative or helpful.

Find `\n{3,}` and replace it with `\n\n`.

**Step 3: Add Paragraphs**

Check dot matches all.

Find `^.+?\n\n` and replace it with `\n<p>\0</p>\n`

**Step 4: Add Chapter Ttitles**

Check case sensitive and uncheck dot matches all.

Find `<p>([IVX]+\..+\n\n)</p>` and replace it with `<title>\1</title>`

**Step 5: Add Chapter Organization**

Check dot matches all.

Find `(<title>.+?)(?=<title>)>` and replace it with `\n<chapter>\0</chapter>`

**Step 6: Add Quotes**

Check dot matches all.

Find `".+?"` and replace it with `<quote>\0</quote>`.

**Step 7: Final Cleanup**

Add a root element `<book> </book>`, remove `<p> by </p>` in the beginning lines, tag the final line with `<p> </p>`, 
fix table of contents paragraphs tag with `<toc> </toc>`, tag last chapter with `<chapter> </chapter>`.

Highlight the roman numeral lines in the table of contents and select only selected lines and uncheck dot matches all. 
Find `^ +.+` and replace it with `<title\0</title>`.

Replace the pragraph tags for the main title and author.

Double check the first XML line to ensure it remains unaltered.