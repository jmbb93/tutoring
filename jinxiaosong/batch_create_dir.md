批量建立路径
================
李家翔
2019-01-12

在 test 路径批量创建100个路径

``` r
library(stringr)
library(magrittr)
path_list <- str_c("a",1:10)
if (!dir.exists("test")) {
    dir.create("test")
}

create_path <- function(x) {
    path = file.path("test",x)
    if (!dir.exists(path)) {
        dir.create(path)
    }
}
library(purrr)
```

    ## 
    ## Attaching package: 'purrr'

    ## The following object is masked from 'package:magrittr':
    ## 
    ##     set_names

``` r
path_list %>% 
    map(create_path)
```

    ## [[1]]
    ## NULL
    ## 
    ## [[2]]
    ## NULL
    ## 
    ## [[3]]
    ## NULL
    ## 
    ## [[4]]
    ## NULL
    ## 
    ## [[5]]
    ## NULL
    ## 
    ## [[6]]
    ## NULL
    ## 
    ## [[7]]
    ## NULL
    ## 
    ## [[8]]
    ## NULL
    ## 
    ## [[9]]
    ## NULL
    ## 
    ## [[10]]
    ## NULL
