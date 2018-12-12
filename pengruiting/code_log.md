code log
================

### 2018-12-12 14:02:30

1.  How to count
2.  combine logic

<!-- end list -->

``` sql
SELECT 
    count(1)
    ,b.company_clean
FROM xyjl.t181115_subsetmainsms_ljx a
INNER JOIN [shuffle] xyjl.wd_7 b
ON a.content= b.content
WHERE messagetime>='2018-09-01'
    AND messagetime<='2018-11-30'
group by
```

### 2018-12-06 16:41:00

``` sql
select*
from
(select * 
from xyjl.t181115_subsetmainsms_ljx
where messagetime>='2018-05-30' and messagetime<='2018-11-30'
--and convert(char(8),messagetime,108)>='22:30:00' and convert(char(8),messagetime,108)<='23:00:00'
order by user_id) a
where content like '%注册%'
limit 1000

-- 加xyjl 库名
-- from (...) 加 alias，无论是with 还是 from 格式
```

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
