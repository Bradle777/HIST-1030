# Regex Exam
This Regex is to tag everything from the main-title *Dracula*, just above the first chapter, until the very last chapter. 
To tag the forematter, ie Table of Contents, publisher, author, etc. I would recommend copying them over to another file,
marking them up seperately, and pasting it in after the fact. 

**Step 1: Reserved Characters**

First find `&` and replace it with `&amp;`. Then find `<` and replace it with `&lt;`.

**Step 2: Double Lines**

Remove double lines that are not informative or helpful.

Find `\n{3,}` and replace it with `\n\n`.

**Step 3: Date and Place**

Find `^_(.+?\.)(.+?\.)*_` with dot matches all unchecked, and replace it with `<date-place><date>\1</date><place>\2</place></date-place>`.
The find `<place></place>` and replace it with nothing, for the dates that do not have a place with them.

**Step 4: Paragraphs**

Find `.+?\n\n` where dot matches all, and replace it with `<p>\0</p>`.
Check that the very last paragraph was tagged, if not tag it manually.
Fix Dracula main title and replace the paragraph tags with `<main-title>` tags.

**Step 5: Titles and Labels**

Find `<p>(CHAPTER [IVX]+\n\n)</p>` and replace it with `<label>\1</label>`.
Find `</label><p>(.+\n\n)</p>` where dot does not match all and replace it with `</label><title>\1</title>`.
Find `</title><p>\(_(.+)_\)(\n\n)</p>` with dot matches all unchecked, and replace it with `</title><sub-title>\1\2</sub-title>`.

**Step 6:Diary Entry**

Find `(<p><date-place>.+?)(?=<p><date-place>)` with dot matches all checked, and replace it with `<diary-entry>\0</diary-entry>`.
Then tag the very last diary entry manually with the same tag.
To fix entries that end at the end of a chapter:
Find `title></diary-entry>` and replace it with `title>`. Note that this is not a typo, removing the `<` allows it to apply to titles and sub-titles.
Find `</p><label>` and replace it with `</p></diary-entry><label>`

**Step 7: Chapters**

First, add a singular `<label>` tag at the end of the very last chapter.
Find `(<label>.+?)(?=<label>)` with dot matches all checked and replace it with `<chapter>\0</chapter>`.
Then delete the `<label>` tag you first created.

**Step 8: Italics**

Find `_(.+)_` where dot does not match all and replace it with `<emph>\1</emph>`.
Use the emphasis tag because the memorandum text is so he remembers, hence emphasizing.
**Step 9: Cleanup**

Tag the entire document with the root element `<novel>  </novel>`.
Lastly press pretty print.