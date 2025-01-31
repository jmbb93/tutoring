餐补 - difftime
================

``` r
knitr::opts_chunk$set(message=FALSE, warning=FALSE)
library(hms)
library(readxl)
library(lubridate)
library(magrittr)
library(tidyverse)
library(data.table)
```

# 结论

`difftime`函数会自调整单位，不建议使用，使用`lubridate::d*`类的函数。

查看`difftime`函数

``` r
difftime(time1, time2, tz,
         units = c("auto", "secs", "mins", "hours",
                   "days", "weeks"))
```

`units = "auto"`参数会根据数值大小，而调整单位。

以下举例。

``` r
t1 <- c("09:28:0018:44:00","09:56:0009:57:00")
t2 <- c("09:28:0018:44:00")
t3 <- c("09:56:0009:57:00")
```

``` r
difftime(as.hms(str_sub(t1, 9, 16)), as.hms(str_sub(t1, 1, 8)))
```

    ## Time differences in mins
    ## [1] 556   1

``` r
difftime(as.hms(str_sub(t2, 9, 16)), as.hms(str_sub(t2, 1, 8)))
```

    ## Time difference of 9.266667 hours

``` r
difftime(as.hms(str_sub(t3, 9, 16)), as.hms(str_sub(t3, 1, 8)))
```

    ## Time difference of 1 mins

``` r
difftime(as.hms(str_sub(t1, 9, 16)), as.hms(str_sub(t1, 1, 8))) > 10
```

    ## [1]  TRUE FALSE

``` r
difftime(as.hms(str_sub(t2, 9, 16)), as.hms(str_sub(t2, 1, 8))) > 10
```

    ## [1] FALSE

``` r
difftime(as.hms(str_sub(t3, 9, 16)), as.hms(str_sub(t3, 1, 8))) > 10
```

    ## [1] FALSE

修正办法是 加上参数`units = 'hours')`

``` r
difftime(as.hms(str_sub(t1, 9, 16)), as.hms(str_sub(t1, 1, 8)),c)
```

    ## Time differences in mins
    ## [1] 556   1

``` r
difftime(as.hms(str_sub(t2, 9, 16)), as.hms(str_sub(t2, 1, 8)),units = 'hours')
```

    ## Time difference of 9.266667 hours

``` r
difftime(as.hms(str_sub(t3, 9, 16)), as.hms(str_sub(t3, 1, 8)),units = 'hours')
```

    ## Time difference of 0.01666667 hours

# 我的答案

``` r
data_work <- 
    data %>% 
    mutate(index = row_number()) %>% 
    gather(var,value,-index) %>% 
    # gather:
    # 数据量小，可操作
    # mutate_all 并行耗时
    mutate(
        begin_time = str_sub(value,1,8)
        ,end_time = str_sub(value,-8,-1)
    ) %>% 
    mutate(
        is_valid = 
            if (
            # 使用if，不改变数据格式
                hms(end_time) > hms('20:00:00')
                & (
                  hms(end_time) - hms(begin_time) >= dhours(10)
                  | hms(begin_time) < hms('10:10:00')
                )
            )
                1
            else 
                0
    ) %>% 
    select(index,var,is_valid) %>% 
    spread(var,is_valid) %>% 
    select(names(data))
```

`A and (B or C)`

``` r
data_work$V29[49]
```

# 修正你的函数

``` r
# data <- read_excel('D:/tmp/canbu/cankao2.xlsx') %>%
data <- read_excel('cankao2.xlsx') %>%
  select(-1) %>%
  setnames(names(.), c(paste0('V', 1:ncol(.)))) %>%
  mutate_all(~str_replace_all(., '  \\r\\n', ':00')) %>%
  mutate_all(~str_replace_all(., '(\\d{2}:\\d{2}:00)\\s*\\S*(\\d{2}:\\d{2})', '\\$1\\$2:00')) %>%
  mutate_all(~str_replace_all(., '\\\\', '')) %>%
  mutate_all(
    ~ifelse(
      as.hms(str_sub(., 9, 16)) <= as.hms(str_sub(., 1, 8)),
      str_replace_all(., str_sub(., 9, 16), '24:00:00'), .
    )
  )
```

``` r
data[49,'V29']
```

    ## # A tibble: 1 x 1
    ##   V29             
    ##   <chr>           
    ## 1 10:23:0020:16:00

``` r
data_work <- 
  data %>%
  mutate_all(
    ~ifelse(
      (as.hms(str_sub(., 9, 16)) >= as.hms('20:00:00')    # 下班打卡时间在 20:00 之后
      & difftime(as.hms(str_sub(., 9, 16)), as.hms(str_sub(., 1, 8)),unit = 'hours') >= 10) # 时间差 ≥10 小时
      
      | (as.hms(str_sub(., 9, 16)) >= as.hms('20:00:00')  # 下班打卡时间在 20:00 之后
      & as.hms(str_sub(., 1, 8))  <= as.hms('10:10:00')), # 上班打卡时间在 10:10 之前 
      1, 0
    )
  )

data_work$V29[49]
```

    ## [1] 0

# 附录

第49行29列的上班打卡时间和下班打卡时间应该是`'10:23:00'`和`'20:16:00'`，按照以下逻辑是不给餐补的

这个逻辑就是

1.  满足条件一 下班打卡时间在20:00之后&上班和下班打卡时间差满10小时
2.  满足条件二 下班打卡时间在20:00之后&上班打卡时间在10:10之前

都给餐补

  - 疑问之处  
    但是运行后返回的居然是给餐补
