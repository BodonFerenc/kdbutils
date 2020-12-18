

## disp

 Displays a table/list/map without truncation, i.e. you dont need to set console size. It can also display more than 2000 rows.

**Parameter:**

|Name|Type|Description|
|---|---|---|
|x|table\|list\|map|Anything that spans over many lines.|

## include

 Use this instead of `\l file.q` or `system "l file"` to allow the loader script to be anywhere.

**Parameter:**

|Name|Type|Description|
|---|---|---|
|||x the file to be loaded|

## inf

 Returns true if the input is an infinite of any type

**Parameter:**

|Name|Type|Description|
|---|---|---|
|x|scalar\|list|Nested lists are handled properly|
