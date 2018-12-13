anti fraud
================

``` r
knitr::opts_chunk$set(warning = FALSE, message = FALSE)
```

``` r
list.files()
```

    ## [1] "ah_data_base.csv" "note.md"          "note.Rmd"        
    ## [4] "song_heop_2.zip"  "维度解释.txt"

``` r
library(xfun)
read_utf8('维度解释.txt')
```

    ##  [1] "<U+FEFF>user_id：申请人唯一编码" "name：申请人姓名"               
    ##  [3] "phone_no：手机号"                "id_no：身份证号"                
    ##  [5] "passdue_day：是否逾期（均逾期）" "registered_from：注册渠道"      
    ##  [7] "registered_at：注册时间"         "applied_at：申请时间"           
    ##  [9] "province：省份证（省）"          "phone_province：手机（省）"     
    ## [11] "city：省份证（市）"              "phone_city：手机（市）"         
    ## [13] "district：省份证（区/县）"

``` r
library(data.table)
data <- fread('ah_data_base.csv',encoding = 'UTF-8')
```

``` r
library(tidyverse)
data %>% 
    group_by(province) %>% 
    count()
```

    ## # A tibble: 26 x 2
    ## # Groups:   province [26]
    ##    province           n
    ##    <chr>          <int>
    ##  1 安徽省             1
    ##  2 北京市             3
    ##  3 福建省            13
    ##  4 甘肃省             1
    ##  5 广西壮族自治区     6
    ##  6 贵州省             2
    ##  7 海南省             6
    ##  8 河北省             1
    ##  9 河南省            35
    ## 10 黑龙江省          23
    ## # ... with 16 more rows

1.  <input type="checkbox" id="checkbox1" class="styled">`passdue_day`这个可以看到逾期天数和第几次逾期吗？
2.  第二个优先级滞后，我看到这里只有地理信息比较有用，整理省份的接壤数据，参考这个
    [GitHub文档](https://github.com/JiaxiangBU/tutoring/blob/master/zhangxinyue/border.md)
