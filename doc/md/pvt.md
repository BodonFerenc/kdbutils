

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
|kt|keyed table|input keyed table|

**Returns:**

|Type|Description|
|---|---|
|keyed table|the keyed table derived from the input table|

**Example:**

```q
 N: 1000;

 .pvt.pivot select sum v by date, p from
      ([] date: N?.z.D + til 10; p: N?`1; v: N?10)

 .Q.id .pvt.pivot select sum v by k, d from
      ([] k: N?`1; d: N?.z.D + til 5; v: N?10)
```

## .pvt.pivotWithTotal

 This function is a projection of pivotWithTotalGen setting the last parameter to `Total`

## .pvt.pivotWithTotalGen

 Function returns the pivot table extended by a total column and a total row.


**Parameters:**

|Name|Type|Description|
|---|---|---|
|fn|(dict) -> keyed table|an unary function that accepts a dictionary of groupbys and returns a keyed table. Typically, this is a projection of a functional select omitting the third parameter.|
|grp|dict|dictionary of groupbys|
|allname|symbol|name of the total column, e.g. `Total` or `All`|

**Returns:**

|Type|Description|
|---|---|
|keyed table|pivot table extended by total column and total row|

**Example:**

```q
 N: 1000;
 t: ([] date: N?.z.D + til 10; p: N?`1; v: N?10);

 .pvt.pivotWithTotalGen[
    ?[t; (); ; enlist[`median_v]!enlist (med; `v)];
    `date`p!`date`p; `Total]
```
