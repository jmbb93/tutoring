餐补
================

# 结论

并行条件有问题。正确答案查看 **计算餐补**

``` r
ifelse(
    (
        as.hms(str_sub(., 9, 16)) >= as.hms('20:00:00')    # 下班打卡时间在 20:00 之后
        & difftime(as.hms(str_sub(., 9, 16)), as.hms(str_sub(., 1, 8))) >= 10
    ) # 时间差 ≥10 小时
    | (
        as.hms(str_sub(., 9, 16)) >= as.hms('20:00:00')  # 下班打卡时间在 20:00 之后  
        & as.hms(str_sub(., 1, 8))  <= as.hms('10:10:00')
    )
    # 上班打卡时间在 10:10 之前 1
    ,1,0)
```

# 导入数据并处理

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

\(\surd\)第49行29列的上班打卡时间和下班打卡时间应该是’10:23:00’和’20:16:00’

# 计算餐补

第49行29列的上班打卡时间和下班打卡时间应该是`'10:23:00'`和`'20:16:00'`，按照以下逻辑是不给餐补的

这个逻辑就是

1.  满足条件一 下班打卡时间在20:00之后&上班和下班打卡时间差满10小时
2.  满足条件二 下班打卡时间在20:00之后&上班打卡时间在10:10之前

都给餐补

  - 疑问之处  
    但是运行后返回的居然是给餐补

<!-- end list -->

``` r
(
  hms('20:16:00') - hms('10:23:00') >= dhours(10)
) |
(
  hms('20:16:00') > hms('20:00:00') & hms('10:23:00') < hms('10:10:00')
)
```

    ## [1] FALSE

``` r
data_work <- 
  data %>%
  mutate_all(
    ~ifelse(
      (as.hms(str_sub(., 9, 16)) >= as.hms('20:00:00')    # 下班打卡时间在 20:00 之后
      & difftime(as.hms(str_sub(., 9, 16)), as.hms(str_sub(., 1, 8))) >= 10) # 时间差 ≥10 小时
      
      | (as.hms(str_sub(., 9, 16)) >= as.hms('20:00:00')  # 下班打卡时间在 20:00 之后
      & as.hms(str_sub(., 1, 8))  <= as.hms('10:10:00')), # 上班打卡时间在 10:10 之前 
      1, 0
    )
  )

data_work$V29[49]
```

    ## [1] 1

``` r
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
            if_else(
                (
                  hms(end_time) - hms(begin_time) >= dhours(10)
                ) |
                (
                  hms(end_time) > hms('20:00:00') & hms(begin_time) < hms('10:10:00')
                )
                ,1,0
            )
    ) %>% 
    select(index,var,is_valid) %>% 
    spread(var,is_valid) %>% 
    select(names(data)) -> data_work
```

``` r
data_work$V29[49]
```

    ## [1] 0

# 代码测试

把这个时间拿出来测试一下，发现返回的是0，即不给餐补，是正确的。

``` r
ifelse(
  (as.hms(str_sub('10:23:0020:16:00', 9, 16)) >= as.hms('20:00:00')    # 下班打卡时间在 20:00 之后
   & difftime(as.hms(str_sub('10:23:0020:16:00', 9, 16)), 
              as.hms(str_sub('10:23:0020:16:00', 1, 8))) >= 10)         # 时间差 ≥10 小时
  
  | (as.hms(str_sub('10:23:0020:16:00', 9, 16)) >= as.hms('20:00:00')  # 下班打卡时间在 20:00 之后
  & as.hms(str_sub('10:23:0020:16:00', 1, 8))  <= as.hms('10:10:00')), # 上班打卡时间在 10:10 之前 
  1, 0
)
```

    ## [1] 0
