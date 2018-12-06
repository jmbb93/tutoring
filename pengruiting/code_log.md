code log
================

### 2018-12-06 15:49:46

group by + count

``` git
with a as (
    select 1 as x1 union all
    select 2 as x1 union all
    select 3 as x1 union all
    select 4 as x1 union all
    select 5 as x1 union all
    select 3 as x1
)
select count(1), x1
from a
group by 2
```
