# Regex Assignment 1

**Step 1: Reserved Characters**

Find and replace & with `&amp;`

Find and replace < with `&lt;`

& must go first because there is an & in the entity for <, so that would be replaced on accident.

There are no & or < in this corpus so nothing was repalced

*Note: I will add title, author, and root element markup at the end.*

**Step 2: Leading Space Characters**

Find `^ +` and replace it with nothing.

I am going to leave blank lines to enhance legibility.

**Step 3: Lines**

To tag each line seperately find `.+` and replace it with `<line>\0</line>`

This applies to the roman numerals as well, so I will fix that in the next step.

**Step 4: Roman Numerals**

To fix and add attribute values to the roman numerals find `<line>([IVXLC]+)</line>` and replace 
it with `</sonnet>   <sonnet number="\1">`. There is a new line in between the tags.

Manually add the very first and very last sonnet tags.

**Step 5: Title and Author**

Fix the markup for the title and the author lines individually with `<title>  </title>` and `<author>  </author>`.

Also add the root element `<sonnets>  </sonnets>` to the beginning and the end.
