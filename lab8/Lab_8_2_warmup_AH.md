---
title: "Lab 8_2 warmup"
author: "Aryss Hearne"
date: "2/3/2021"
output: 
  html_document: 
    keep_md: yes
---




```r
library("tidyverse")
```

```
## -- Attaching packages --------------------------------------- tidyverse 1.3.0 --
```

```
## v ggplot2 3.3.3     v purrr   0.3.4
## v tibble  3.0.4     v dplyr   1.0.2
## v tidyr   1.1.2     v stringr 1.4.0
## v readr   1.4.0     v forcats 0.5.0
```

```
## -- Conflicts ------------------------------------------ tidyverse_conflicts() --
## x dplyr::filter() masks stats::filter()
## x dplyr::lag()    masks stats::lag()
```



```r
datasets::USPersonalExpenditure
```

```
##                       1940   1945  1950 1955  1960
## Food and Tobacco    22.200 44.500 59.60 73.2 86.80
## Household Operation 10.500 15.500 29.00 36.5 46.20
## Medical and Health   3.530  5.760  9.71 14.0 21.10
## Personal Care        1.040  1.980  2.45  3.4  5.40
## Private Education    0.341  0.974  1.80  2.6  3.64
```

```r
?USPersonalExpenditure
```

```
## starting httpd help server ... done
```


```r
expenditures<-
  USPersonalExpenditure%>%
  as_tibble()%>%
  mutate(expenditure=rownames(USPersonalExpenditure))
expenditures
```

```
## # A tibble: 5 x 6
##   `1940` `1945` `1950` `1955` `1960` expenditure        
##    <dbl>  <dbl>  <dbl>  <dbl>  <dbl> <chr>              
## 1 22.2   44.5    59.6    73.2  86.8  Food and Tobacco   
## 2 10.5   15.5    29      36.5  46.2  Household Operation
## 3  3.53   5.76    9.71   14    21.1  Medical and Health 
## 4  1.04   1.98    2.45    3.4   5.4  Personal Care      
## 5  0.341  0.974   1.8     2.6   3.64 Private Education
```

```r
c_expeditures<-
  expenditures%>%
  pivot_longer(-c(expenditure),
               names_to="year",
               values_to="mil_spent")%>%
  select(expenditure, year, mil_spent)%>%
  filter(expenditure=="Medical and Health")%>%
  arrange(mil_spent)
c_expeditures
```

```
## # A tibble: 5 x 3
##   expenditure        year  mil_spent
##   <chr>              <chr>     <dbl>
## 1 Medical and Health 1940       3.53
## 2 Medical and Health 1945       5.76
## 3 Medical and Health 1950       9.71
## 4 Medical and Health 1955      14   
## 5 Medical and Health 1960      21.1
```


```r
heartrate2<-readr::read_csv("data/heartrate2.csv")
```

```
## 
## -- Column specification --------------------------------------------------------
## cols(
##   patient = col_character(),
##   a = col_double(),
##   b = col_double(),
##   c = col_double(),
##   d = col_double()
## )
```

```r
heartrate2
```

```
## # A tibble: 6 x 5
##   patient        a     b     c     d
##   <chr>      <dbl> <dbl> <dbl> <dbl>
## 1 Margaret_f    72    74    80    68
## 2 Frank_m       84    84    88    76
## 3 Hawkeye_m     64    66    68    64
## 4 Trapper_m     60    58    64    58
## 5 Radar_m       74    72    78    70
## 6 Henry_m       88    87    88    72
```


```r
heartrate2%>%
  separate(patient, into=c("patient","sex"),sep="_")
```

```
## # A tibble: 6 x 6
##   patient  sex       a     b     c     d
##   <chr>    <chr> <dbl> <dbl> <dbl> <dbl>
## 1 Margaret f        72    74    80    68
## 2 Frank    m        84    84    88    76
## 3 Hawkeye  m        64    66    68    64
## 4 Trapper  m        60    58    64    58
## 5 Radar    m        74    72    78    70
## 6 Henry    m        88    87    88    72
```


```r
heartrate3<-
  heartrate2%>%
  separate(patient,
           into=c("patient","sex"),
           sep="_")%>%
  pivot_longer(-c(patient, sex),
               names_to="drug",
               values_to="heartrate")%>%
  arrange(patient, drug)
heartrate3
```

```
## # A tibble: 24 x 4
##    patient sex   drug  heartrate
##    <chr>   <chr> <chr>     <dbl>
##  1 Frank   m     a            84
##  2 Frank   m     b            84
##  3 Frank   m     c            88
##  4 Frank   m     d            76
##  5 Hawkeye m     a            64
##  6 Hawkeye m     b            66
##  7 Hawkeye m     c            68
##  8 Hawkeye m     d            64
##  9 Henry   m     a            88
## 10 Henry   m     b            87
## # ... with 14 more rows
```


```r
tb_data<-read_csv("data/tb_data.csv")
```

```
## 
## -- Column specification --------------------------------------------------------
## cols(
##   country = col_character(),
##   year = col_double(),
##   key = col_character(),
##   value = col_double()
## )
```

```r
tb_data
```

```
## # A tibble: 12 x 4
##    country      year key             value
##    <chr>       <dbl> <chr>           <dbl>
##  1 Afghanistan  1999 cases             745
##  2 Afghanistan  1999 population   19987071
##  3 Afghanistan  2000 cases            2666
##  4 Afghanistan  2000 population   20595360
##  5 Brazil       1999 cases           37737
##  6 Brazil       1999 population  172006362
##  7 Brazil       2000 cases           80488
##  8 Brazil       2000 population  174504898
##  9 China        1999 cases          212258
## 10 China        1999 population 1272915272
## 11 China        2000 cases          213766
## 12 China        2000 population 1280428583
```


```r
tb_data%>%
  pivot_wider(names_from="key",
              values_from="value")
```

```
## # A tibble: 6 x 4
##   country      year  cases population
##   <chr>       <dbl>  <dbl>      <dbl>
## 1 Afghanistan  1999    745   19987071
## 2 Afghanistan  2000   2666   20595360
## 3 Brazil       1999  37737  172006362
## 4 Brazil       2000  80488  174504898
## 5 China        1999 212258 1272915272
## 6 China        2000 213766 1280428583
```

```r
gene_exp<-readr::read_csv("data/gene_exp.csv")
```

```
## 
## -- Column specification --------------------------------------------------------
## cols(
##   gene_id = col_character(),
##   type = col_character(),
##   L4_values = col_double()
## )
```


```r
gene_exp
```

```
## # A tibble: 6 x 3
##   gene_id type      L4_values
##   <chr>   <chr>         <dbl>
## 1 gene1   treatment      15.6
## 2 gene1   control        19.3
## 3 gene2   treatment      22.2
## 4 gene2   control        16.0
## 5 gene3   treatment      17.7
## 6 gene3   control        26.9
```

```r
gene_exp%>%
  pivot_wider(names_from="type",
              values_from="L4_values")
```

```
## # A tibble: 3 x 3
##   gene_id treatment control
##   <chr>       <dbl>   <dbl>
## 1 gene1        15.6    19.3
## 2 gene2        22.2    16.0
## 3 gene3        17.7    26.9
```


```r
edu_level<-readr::read_csv("data/education_level.csv")
```

```
## 
## -- Column specification --------------------------------------------------------
## cols(
##   sex = col_character(),
##   race = col_character(),
##   education_level = col_character(),
##   mean_income = col_double(),
##   n = col_double()
## )
```

```r
edu_level
```

```
## # A tibble: 8 x 5
##   sex   race  education_level mean_income     n
##   <chr> <chr> <chr>                 <dbl> <dbl>
## 1 F     B     BA                     99.2   110
## 2 F     B     HS                    100.    104
## 3 F     W     BA                     94.5   125
## 4 F     W     HS                     97.5   141
## 5 M     B     BA                     93.8   126
## 6 M     B     HS                     94.6   129
## 7 M     W     BA                    103.    138
## 8 M     W     HS                    103.    127
```

```r
edu_level%>%
  pivot_wider(names_from=(education_level),
              values_from=c(mean_income,n))
```

```
## # A tibble: 4 x 6
##   sex   race  mean_income_BA mean_income_HS  n_BA  n_HS
##   <chr> <chr>          <dbl>          <dbl> <dbl> <dbl>
## 1 F     B               99.2          100.    110   104
## 2 F     W               94.5           97.5   125   141
## 3 M     B               93.8           94.6   126   129
## 4 M     W              103.           103.    138   127
```

```r
beachbugs<-readr::read_csv("data/beachbugs_long.csv")
```

```
## 
## -- Column specification --------------------------------------------------------
## cols(
##   year = col_double(),
##   site = col_character(),
##   buglevels = col_double()
## )
```


```r
beachbugs
```

```
## # A tibble: 66 x 3
##     year site                    buglevels
##    <dbl> <chr>                       <dbl>
##  1  2013 Bondi Beach                 32.2 
##  2  2013 Bronte Beach                26.8 
##  3  2013 Clovelly Beach               9.28
##  4  2013 Coogee Beach                39.7 
##  5  2013 Gordons Bay (East)          24.8 
##  6  2013 Little Bay Beach           122.  
##  7  2013 Malabar Beach              101.  
##  8  2013 Maroubra Beach              47.1 
##  9  2013 South Maroubra Beach        39.3 
## 10  2013 South Maroubra Rockpool     96.4 
## # ... with 56 more rows
```


```r
beachbugsw<-
  beachbugs%>%
  pivot_wider(names_from = (site),
              values_from=(buglevels))
beachbugsw
```

```
## # A tibble: 6 x 12
##    year `Bondi Beach` `Bronte Beach` `Clovelly Beach` `Coogee Beach`
##   <dbl>         <dbl>          <dbl>            <dbl>          <dbl>
## 1  2013          32.2           26.8             9.28           39.7
## 2  2014          11.1           17.5            13.8            52.6
## 3  2015          14.3           23.6             8.82           40.3
## 4  2016          19.4           61.3            11.3            59.5
## 5  2017          13.2           16.8             7.93           20.7
## 6  2018          22.9           43.4            10.6            21.6
## # ... with 7 more variables: `Gordons Bay (East)` <dbl>, `Little Bay
## #   Beach` <dbl>, `Malabar Beach` <dbl>, `Maroubra Beach` <dbl>, `South
## #   Maroubra Beach` <dbl>, `South Maroubra Rockpool` <dbl>, `Tamarama
## #   Beach` <dbl>
```


```r
beachbugsl<-
  beachbugsw%>%
  pivot_longer(
    "Bondi Beach":"Tamarama Beach",
    names_to = "beach",
    values_to="buglevels")%>%
  arrange(desc(buglevels))
beachbugsl
```

```
## # A tibble: 66 x 3
##     year beach                   buglevels
##    <dbl> <chr>                       <dbl>
##  1  2013 Little Bay Beach            122. 
##  2  2018 South Maroubra Rockpool     112. 
##  3  2013 Malabar Beach               101. 
##  4  2013 South Maroubra Rockpool      96.4
##  5  2016 Malabar Beach                91.0
##  6  2015 Malabar Beach                66.9
##  7  2016 Bronte Beach                 61.3
##  8  2016 Coogee Beach                 59.5
##  9  2016 South Maroubra Rockpool      59.3
## 10  2018 Little Bay Beach             59.1
## # ... with 56 more rows
```

