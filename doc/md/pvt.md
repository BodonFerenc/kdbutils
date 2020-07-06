

## .pvt.g

 The default column order function. The key columns first, then pivot columns in ascending order.

## .pvt.getColNameFnDefault

 The default column name function in which the column names are the underscore separated pivot values.

## .pvt.piv

 This general function returns the pivot of a table.
 It is a slight modification of the function available at https://code.kx.com/q/kb/pivoting-tables/
 modifications include: (1) `p` can be a scalar, (2) `t` can be a keyed table

**Parameters:**

|Name|Type|Description|
|---|---|---|
|t|table|input keyed table|
|k|symbol[]|key columns|
|p|symbol[]|pivot columns|
|v|symbol[]|value columns|
|f|fn|a function of v and pivot values to name the new columns|
|g|fn|a function of k, pivot values, and the return of f to order the new columns|

**Returns:**

|Type|Description|
|---|---|
|table|the pivoted table derived from the input table|

## .pvt.pivKT

 Function returns the pivot of a keyed table. The pivot column is the last key column
 and the value columns are the columns of the value of the keyed table.

**Parameter:**

|Name|Type|Description|
|---|---|---|
|kt|keyed table|input keyed table|

## .pvt.pivot

 Function returns the pivot of a keyed table setting the pivot column to the last key column.

 Pass the output to [.Q.id](https://code.kx.com/q/ref/dotq/#qid-sanitize) to get sanitized column names if you would like to process the output in a safe way.

**Parameter:**

|Name|Type|Description|
|---|---|---|
|&lt;param&gt;|table|input keyed table|

**Returns:**

|Type|Description|
|---|---|
|keyed table|the keyed table derived from the input table|

**Example:**

```q
 N:1000;
 .pvt.pivot select sum v by k, p from
      ([] k: N?.z.D + til 10; p: N?`1; v: N?10)

 .Q.id .pvt.pivot select sum v by k, d from
      ([] k: N?`1; d: N?.z.D + til 5; v: N?10)
```