---
title: "R_warmup_6_1"
author: "Aryss Hearne"
date: "1/21/2021"
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
library("janitor")
```

```
## 
## Attaching package: 'janitor'
```

```
## The following objects are masked from 'package:stats':
## 
##     chisq.test, fisher.test
```

```r
#install.packages("skimr")
library("skimr")
```



```r
?msleep
```

```
## starting httpd help server ... done
```

```r
names(msleep)
```

```
##  [1] "name"         "genus"        "vore"         "order"        "conservation"
##  [6] "sleep_total"  "sleep_rem"    "sleep_cycle"  "awake"        "brainwt"     
## [11] "bodywt"
```

```r
remotes::install_github("allisonhorst/palmerpenguins")
```

```
## Skipping install of 'palmerpenguins' from a github remote, the SHA1 (69530276) has not changed since last install.
##   Use `force = TRUE` to force installation
```
# dplyr Practice
#### 1. Let’s do a bit more practice to make sure that we understand `select()`, `filter()`, and `mutate()`. Start by building a new data frame `msleep24` from the `msleep` data that: contains the `name` and `vore` variables along with a new column called `sleep_total_24` which is the amount of time a species sleeps expressed as a proportion of a `24-hour day`. Remove any rows with NA’s and restrict the `sleep_total_24` values to less than 0.3. Arrange the output in descending order.


```r
msleep%>%
  mutate(sleep_total_24=sleep_total/24)%>%
  select(name, vore, sleep_total_24)%>%
  filter(sleep_total_24<=0.3)%>%
  na.omit(msleep)%>%
  arrange(desc(sleep_total_24))
```

```
## # A tibble: 18 x 3
##    name                 vore  sleep_total_24
##    <chr>                <chr>          <dbl>
##  1 Gray hyrax           herbi         0.262 
##  2 Genet                carni         0.262 
##  3 Gray seal            carni         0.258 
##  4 Common porpoise      carni         0.233 
##  5 Goat                 herbi         0.221 
##  6 Tree hyrax           herbi         0.221 
##  7 Bottle-nosed dolphin carni         0.217 
##  8 Brazilian tapir      herbi         0.183 
##  9 Cow                  herbi         0.167 
## 10 Asian elephant       herbi         0.162 
## 11 Sheep                herbi         0.158 
## 12 Caspian seal         carni         0.146 
## 13 African elephant     herbi         0.137 
## 14 Donkey               herbi         0.129 
## 15 Roe deer             herbi         0.125 
## 16 Horse                herbi         0.121 
## 17 Pilot whale          carni         0.112 
## 18 Giraffe              herbi         0.0792
```


```r
summary(msleep)
```

```
##      name              genus               vore              order          
##  Length:83          Length:83          Length:83          Length:83         
##  Class :character   Class :character   Class :character   Class :character  
##  Mode  :character   Mode  :character   Mode  :character   Mode  :character  
##                                                                             
##                                                                             
##                                                                             
##                                                                             
##  conservation        sleep_total      sleep_rem      sleep_cycle    
##  Length:83          Min.   : 1.90   Min.   :0.100   Min.   :0.1167  
##  Class :character   1st Qu.: 7.85   1st Qu.:0.900   1st Qu.:0.1833  
##  Mode  :character   Median :10.10   Median :1.500   Median :0.3333  
##                     Mean   :10.43   Mean   :1.875   Mean   :0.4396  
##                     3rd Qu.:13.75   3rd Qu.:2.400   3rd Qu.:0.5792  
##                     Max.   :19.90   Max.   :6.600   Max.   :1.5000  
##                                     NA's   :22      NA's   :51      
##      awake          brainwt            bodywt        
##  Min.   : 4.10   Min.   :0.00014   Min.   :   0.005  
##  1st Qu.:10.25   1st Qu.:0.00290   1st Qu.:   0.174  
##  Median :13.90   Median :0.01240   Median :   1.670  
##  Mean   :13.57   Mean   :0.28158   Mean   : 166.136  
##  3rd Qu.:16.15   3rd Qu.:0.12550   3rd Qu.:  41.750  
##  Max.   :22.10   Max.   :5.71200   Max.   :6654.000  
##                  NA's   :27
```

```r
skim(msleep)
```


Table: Data summary

|                         |       |
|:------------------------|:------|
|Name                     |msleep |
|Number of rows           |83     |
|Number of columns        |11     |
|_______________________  |       |
|Column type frequency:   |       |
|character                |5      |
|numeric                  |6      |
|________________________ |       |
|Group variables          |None   |


**Variable type: character**

|skim_variable | n_missing| complete_rate| min| max| empty| n_unique| whitespace|
|:-------------|---------:|-------------:|---:|---:|-----:|--------:|----------:|
|name          |         0|          1.00|   3|  30|     0|       83|          0|
|genus         |         0|          1.00|   3|  13|     0|       77|          0|
|vore          |         7|          0.92|   4|   7|     0|        4|          0|
|order         |         0|          1.00|   6|  15|     0|       19|          0|
|conservation  |        29|          0.65|   2|  12|     0|        6|          0|


**Variable type: numeric**

|skim_variable | n_missing| complete_rate|   mean|     sd|   p0|   p25|   p50|   p75|    p100|hist                                     |
|:-------------|---------:|-------------:|------:|------:|----:|-----:|-----:|-----:|-------:|:----------------------------------------|
|sleep_total   |         0|          1.00|  10.43|   4.45| 1.90|  7.85| 10.10| 13.75|   19.90|▅▅▇▆▂ |
|sleep_rem     |        22|          0.73|   1.88|   1.30| 0.10|  0.90|  1.50|  2.40|    6.60|▇▆▂▁▁ |
|sleep_cycle   |        51|          0.39|   0.44|   0.36| 0.12|  0.18|  0.33|  0.58|    1.50|▇▂▁▁▁ |
|awake         |         0|          1.00|  13.57|   4.45| 4.10| 10.25| 13.90| 16.15|   22.10|▂▅▇▃▅ |
|brainwt       |        27|          0.67|   0.28|   0.98| 0.00|  0.00|  0.01|  0.13|    5.71|▇▁▁▁▁ |
|bodywt        |         0|          1.00| 166.14| 786.84| 0.00|  0.17|  1.67| 41.75| 6654.00|▇▁▁▁▁ |
#Practice
#### Which taxonomic orders have species that belong to more than one class of `vore`? 



```r
msleep%>%
  select(name, genus, order, vore)%>%
  filter(vore!="herbi"&vore!="carni")
```

```
## # A tibble: 25 x 4
##    name                       genus         order           vore   
##    <chr>                      <chr>         <chr>           <chr>  
##  1 Owl monkey                 Aotus         Primates        omni   
##  2 Greater short-tailed shrew Blarina       Soricomorpha    omni   
##  3 Grivet                     Cercopithecus Primates        omni   
##  4 Star-nosed mole            Condylura     Soricomorpha    omni   
##  5 African giant pouched rat  Cricetomys    Rodentia        omni   
##  6 Lesser short-tailed shrew  Cryptotis     Soricomorpha    omni   
##  7 North American Opossum     Didelphis     Didelphimorphia omni   
##  8 Big brown bat              Eptesicus     Chiroptera      insecti
##  9 European hedgehog          Erinaceus     Erinaceomorpha  omni   
## 10 Patas monkey               Erythrocebus  Primates        omni   
## # ... with 15 more rows
```

*I dunno - all of these species only have one class of vore - I'm not sure what this question is asking*


```r
head(msleep)
```

```
## # A tibble: 6 x 11
##   name  genus vore  order conservation sleep_total sleep_rem sleep_cycle awake
##   <chr> <chr> <chr> <chr> <chr>              <dbl>     <dbl>       <dbl> <dbl>
## 1 Chee~ Acin~ carni Carn~ lc                  12.1      NA        NA      11.9
## 2 Owl ~ Aotus omni  Prim~ <NA>                17         1.8      NA       7  
## 3 Moun~ Aplo~ herbi Rode~ nt                  14.4       2.4      NA       9.6
## 4 Grea~ Blar~ omni  Sori~ lc                  14.9       2.3       0.133   9.1
## 5 Cow   Bos   herbi Arti~ domesticated         4         0.7       0.667  20  
## 6 Thre~ Brad~ herbi Pilo~ <NA>                14.4       2.2       0.767   9.6
## # ... with 2 more variables: brainwt <dbl>, bodywt <dbl>
```

```r
large<-
  msleep%>%
  select(name, genus, bodywt, sleep_total)%>%
  filter(bodywt>200)%>%
  arrange(desc(bodywt))
large
```

```
## # A tibble: 7 x 4
##   name             genus         bodywt sleep_total
##   <chr>            <chr>          <dbl>       <dbl>
## 1 African elephant Loxodonta      6654          3.3
## 2 Asian elephant   Elephas        2547          3.9
## 3 Giraffe          Giraffa         900.         1.9
## 4 Pilot whale      Globicephalus   800          2.7
## 5 Cow              Bos             600          4  
## 6 Horse            Equus           521          2.9
## 7 Brazilian tapir  Tapirus         208.         4.4
```

```r
mean(large$sleep_total)
```

```
## [1] 3.3
```


```r
msleep %>% 
  filter(bodywt > 200) %>%
  summarize(mean_sleep_lg = mean(sleep_total))
```

```
## # A tibble: 1 x 1
##   mean_sleep_lg
##           <dbl>
## 1           3.3
```

```r
msleep %>% 
    filter(bodywt > 200) %>% 
    summarize(mean_sleep_lg = mean(sleep_total), 
              min_sleep_lg = min(sleep_total),
              max_sleep_lg = max(sleep_total),
              total = n())
```

```
## # A tibble: 1 x 4
##   mean_sleep_lg min_sleep_lg max_sleep_lg total
##           <dbl>        <dbl>        <dbl> <int>
## 1           3.3          1.9          4.4     7
```


```r
msleep%>%
  filter(order=="Primates")%>%
  summarize(mean_bodyweight = mean(bodywt),
            min_bodyweight = min(bodywt),
            max_bodyweight = max(bodywt),
            total=n())
```

```
## # A tibble: 1 x 4
##   mean_bodyweight min_bodyweight max_bodyweight total
##             <dbl>          <dbl>          <dbl> <int>
## 1            13.9            0.2             62    12
```

```r
msleep%>%
  filter(bodywt>100)%>%
  summarise(n_genera=n_distinct(genus))
```

```
## # A tibble: 1 x 1
##   n_genera
##      <int>
## 1        9
```
#Practice
#### 1. How many genera are represented in the msleep data frame?


```r
msleep%>%
  summarise(n_genera=n_distinct(genus))
```

```
## # A tibble: 1 x 1
##   n_genera
##      <int>
## 1       77
```
#### 2. What are the min, max, and mean `sleep_total` for all of the mammals? Be sure to include the total n.


```r
msleep%>%
  select(name, sleep_total)%>%
  summarize(mean_sleep=mean(sleep_total),
            max_sleep=max(sleep_total),
            min_sleep=min(sleep_total),
            total=n())
```

```
## # A tibble: 1 x 4
##   mean_sleep max_sleep min_sleep total
##        <dbl>     <dbl>     <dbl> <int>
## 1       10.4      19.9       1.9    83
```


```r
msleep%>%
  group_by(vore)%>%
  summarize(min_bodywt=min(bodywt),
            max_bodywt=max(bodywt),
            mean_bodywt=mean(bodywt),
            total=n())
```

```
## `summarise()` ungrouping output (override with `.groups` argument)
```

```
## # A tibble: 5 x 5
##   vore    min_bodywt max_bodywt mean_bodywt total
##   <chr>        <dbl>      <dbl>       <dbl> <int>
## 1 carni        0.028      800        90.8      19
## 2 herbi        0.022     6654       367.       32
## 3 insecti      0.01        60        12.9       5
## 4 omni         0.005       86.2      12.7      20
## 5 <NA>         0.021        3.6       0.858     7
```

# Practice
#### 1. Calculate mean brain weight by taxonoimc order in the msleep data. 


```r
msleep%>%
  group_by(order)%>%
  summarize(big_brain_time=mean(brainwt),
            total=n())
```

```
## `summarise()` ungrouping output (override with `.groups` argument)
```

```
## # A tibble: 19 x 3
##    order           big_brain_time total
##    <chr>                    <dbl> <int>
##  1 Afrosoricida          0.0026       1
##  2 Artiodactyla         NA            6
##  3 Carnivora            NA           12
##  4 Cetacea              NA            3
##  5 Chiroptera            0.000275     2
##  6 Cingulata             0.0459       2
##  7 Didelphimorphia      NA            2
##  8 Diprotodontia        NA            2
##  9 Erinaceomorpha        0.00295      2
## 10 Hyracoidea            0.0152       3
## 11 Lagomorpha            0.0121       1
## 12 Monotremata           0.025        1
## 13 Perissodactyla        0.414        3
## 14 Pilosa               NA            1
## 15 Primates             NA           12
## 16 Proboscidea           5.16         2
## 17 Rodentia             NA           22
## 18 Scandentia            0.0025       1
## 19 Soricomorpha          0.000592     5
```

#### 2. What does `NA` mean? How are NAs being treated by the summarize function? 
*NAs are being treated as function-canceling data.*

#### 3. Try running the code again, but this time add `na.rm=TRUE`. What is the problem with Cetacea? Compare this to Carnivora.


```r
msleep%>%
  group_by(order)%>%
  summarize(big_brain_time=mean(brainwt),
            total=n())
```

```
## `summarise()` ungrouping output (override with `.groups` argument)
```

```
## # A tibble: 19 x 3
##    order           big_brain_time total
##    <chr>                    <dbl> <int>
##  1 Afrosoricida          0.0026       1
##  2 Artiodactyla         NA            6
##  3 Carnivora            NA           12
##  4 Cetacea              NA            3
##  5 Chiroptera            0.000275     2
##  6 Cingulata             0.0459       2
##  7 Didelphimorphia      NA            2
##  8 Diprotodontia        NA            2
##  9 Erinaceomorpha        0.00295      2
## 10 Hyracoidea            0.0152       3
## 11 Lagomorpha            0.0121       1
## 12 Monotremata           0.025        1
## 13 Perissodactyla        0.414        3
## 14 Pilosa               NA            1
## 15 Primates             NA           12
## 16 Proboscidea           5.16         2
## 17 Rodentia             NA           22
## 18 Scandentia            0.0025       1
## 19 Soricomorpha          0.000592     5
```

