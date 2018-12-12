code log
================

### 2018-12-12 14:31:27

``` r
df <- data.frame(id = c('a', 'a', 'b'), p = c(1, 2, 1), d = c('A', 'B', 'A')); df
```

    ##   id p d
    ## 1  a 1 A
    ## 2  a 2 B
    ## 3  b 1 A

``` r
df2 <- data.frame(id = c('a', 'b'), p_1 = c(1, 1), p_2 = c(2, NA), d_1 = c('A', 'A'), d_2 = c('B', NA)); df2
```

    ##   id p_1 p_2 d_1  d_2
    ## 1  a   1   2   A    B
    ## 2  b   1  NA   A <NA>

``` r
library(tidyverse)
```

    ## -- Attaching packages ---------------------------------------------- tidyverse 1.2.1 --

    ## √ ggplot2 3.1.0     √ purrr   0.2.5
    ## √ tibble  1.4.2     √ dplyr   0.7.8
    ## √ tidyr   0.8.2     √ stringr 1.3.1
    ## √ readr   1.2.1     √ forcats 0.3.0

    ## -- Conflicts ------------------------------------------------- tidyverse_conflicts() --
    ## x dplyr::filter() masks stats::filter()
    ## x dplyr::lag()    masks stats::lag()

``` r
df %>%
    gather(key,value,-id) %>% 
    # 数据非唯一，因此需要加额外标签
    mutate(key = str_c(key,value,sep = '_')) %>% 
    spread(key,value)
```

    ## Warning: attributes are not identical across measure variables;
    ## they will be dropped

    ##   id d_A  d_B p_1  p_2
    ## 1  a   A    B   1    2
    ## 2  b   A <NA>   1 <NA>

``` r
# LETTERS 需要数字化，用如下表格替换即可
tibble(
    upper = LETTERS
) %>% 
    mutate(num = row_number())
```

    ## # A tibble: 26 x 2
    ##    upper   num
    ##    <chr> <int>
    ##  1 A         1
    ##  2 B         2
    ##  3 C         3
    ##  4 D         4
    ##  5 E         5
    ##  6 F         6
    ##  7 G         7
    ##  8 H         8
    ##  9 I         9
    ## 10 J        10
    ## # ... with 16 more rows
