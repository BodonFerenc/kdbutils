
// @kind function
// @fileoverview Returns true if the input is an infinite of any type
// @param x {scalar|list} Nested lists are handled properly
inf: {$[t:type[x];x=abs[t]$0w;.z.s each x]};

// @kind function
// @fileoverview Displays a table/list/map without truncation, i.e. you dont need to set console size. It can also display more than 2000 rows.
// @param x {table|list|map} Anything that spans over many lines.
disp: {-1 .Q.s2 x;};

// @kind function
// @fileoverview Use this instead of `\l file.q` or `system "l file"` to allow the loader script to be anywhere.
// @param x the file to be loaded
include: {
  curFile: value[{}][6];
  system "l ", sublist[1+last where curFile = "/"; curFile], x;
  }
