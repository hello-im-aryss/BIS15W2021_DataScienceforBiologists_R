---
title: "Lab 6_2 AH"
author: "Aryss Hearne"
date: "1/25/2021"
output: 
  html_document: 
    keep_md: yes
---



---
title: "R Notebook"
output: html_notebook
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
library("skimr")
library("palmerpenguins")
```


```r
glimpse(penguins)
```

```
## Rows: 344
## Columns: 8
## $ species           <fct> Adelie, Adelie, Adelie, Adelie, Adelie, Adelie, A...
## $ island            <fct> Torgersen, Torgersen, Torgersen, Torgersen, Torge...
## $ bill_length_mm    <dbl> 39.1, 39.5, 40.3, NA, 36.7, 39.3, 38.9, 39.2, 34....
## $ bill_depth_mm     <dbl> 18.7, 17.4, 18.0, NA, 19.3, 20.6, 17.8, 19.6, 18....
## $ flipper_length_mm <int> 181, 186, 195, NA, 193, 190, 181, 195, 193, 190, ...
## $ body_mass_g       <int> 3750, 3800, 3250, NA, 3450, 3650, 3625, 4675, 347...
## $ sex               <fct> male, female, female, NA, female, male, female, m...
## $ year              <int> 2007, 2007, 2007, 2007, 2007, 2007, 2007, 2007, 2...
```


```r
penguins%>%
  group_by(island)%>%
  summarize(mean_body_mass_g=mean(body_mass_g),
            n=n())
```

```
## `summarise()` ungrouping output (override with `.groups` argument)
```

```
## # A tibble: 3 x 3
##   island    mean_body_mass_g     n
##   <fct>                <dbl> <int>
## 1 Biscoe                 NA    168
## 2 Dream                3713.   124
## 3 Torgersen              NA     52
```


```r
penguins%>%
  group_by(island)%>%
  summarize(number_NAs=sum(is.na(body_mass_g)))
```

```
## `summarise()` ungrouping output (override with `.groups` argument)
```

```
## # A tibble: 3 x 2
##   island    number_NAs
##   <fct>          <int>
## 1 Biscoe             1
## 2 Dream              0
## 3 Torgersen          1
```


```r
penguins%>%
  filter(!is.na(body_mass_g))%>%
  group_by(island)%>%
  summarize(mean_body_mass_g=mean(body_mass_g),
            sd_body_mass_g=sd(body_mass_g),
            n=n())
```

```
## `summarise()` ungrouping output (override with `.groups` argument)
```

```
## # A tibble: 3 x 4
##   island    mean_body_mass_g sd_body_mass_g     n
##   <fct>                <dbl>          <dbl> <int>
## 1 Biscoe               4716.           783.   167
## 2 Dream                3713.           417.   124
## 3 Torgersen            3706.           445.    51
```


```r
penguins%>%
  group_by(island,species)%>%
  summarize(n=n(),.groups='keep')
```

```
## # A tibble: 5 x 3
## # Groups:   island, species [5]
##   island    species       n
##   <fct>     <fct>     <int>
## 1 Biscoe    Adelie       44
## 2 Biscoe    Gentoo      124
## 3 Dream     Adelie       56
## 4 Dream     Chinstrap    68
## 5 Torgersen Adelie       52
```


```r
penguins%>%
  count(island,sort=T)
```

```
## # A tibble: 3 x 2
##   island        n
##   <fct>     <int>
## 1 Biscoe      168
## 2 Dream       124
## 3 Torgersen    52
```


```r
penguins%>%
  group_by(island)%>%
  summarize(n=n())
```

```
## `summarise()` ungrouping output (override with `.groups` argument)
```

```
## # A tibble: 3 x 2
##   island        n
##   <fct>     <int>
## 1 Biscoe      168
## 2 Dream       124
## 3 Torgersen    52
```


```r
penguins%>%
  count(island,species,sort=T)
```

```
## # A tibble: 5 x 3
##   island    species       n
##   <fct>     <fct>     <int>
## 1 Biscoe    Gentoo      124
## 2 Dream     Chinstrap    68
## 3 Dream     Adelie       56
## 4 Torgersen Adelie       52
## 5 Biscoe    Adelie       44
```


```r
penguins%>%
  tabyl(species,island)
```

```
##    species Biscoe Dream Torgersen
##     Adelie     44    56        52
##  Chinstrap      0    68         0
##     Gentoo    124     0         0
```

```r
penguins%>%
  tabyl(species,island)%>%
  adorn_percentages()%>%
  adorn_pct_formatting(digits=1)%>%
  adorn_ns()
```

```
##    species       Biscoe       Dream  Torgersen
##     Adelie  28.9%  (44)  36.8% (56) 34.2% (52)
##  Chinstrap   0.0%   (0) 100.0% (68)  0.0%  (0)
##     Gentoo 100.0% (124)   0.0%  (0)  0.0%  (0)
```

#Practice
#### Produce a summary of the mean for bill_length_mm, bill_depth_mm, flipper_length_mm, and body_mass_g within Adelie penguins only. Be sure to provide the number of samples.

```r
names(penguins)
```

```
## [1] "species"           "island"            "bill_length_mm"   
## [4] "bill_depth_mm"     "flipper_length_mm" "body_mass_g"      
## [7] "sex"               "year"
```


```r
penguins%>%
  filter(species=="Adelie")%>%
  summarize(mean_bill_length_mm=mean(bill_length_mm, na.rm=T),
            sd_bill_length_mm=sd(bill_length_mm, na.rm=T),
            penguin_flippers=mean(flipper_length_mm, na.rm=T),
            n_samples=n())
```

```
## # A tibble: 1 x 4
##   mean_bill_length_mm sd_bill_length_mm penguin_flippers n_samples
##                 <dbl>             <dbl>            <dbl>     <int>
## 1                38.8              2.66             190.       152
```

#### How does the mean of `bill_length_mm` compare between penguin species? 


```r
penguins%>%
  group_by(species)%>%
  summarize(mean_bill_length_mm_2=mean(bill_length_mm, sort=T, na.rm=T),
            n_samples=n())
```

```
## `summarise()` ungrouping output (override with `.groups` argument)
```

```
## # A tibble: 3 x 3
##   species   mean_bill_length_mm_2 n_samples
##   <fct>                     <dbl>     <int>
## 1 Adelie                     38.8       152
## 2 Chinstrap                  48.8        68
## 3 Gentoo                     47.5       124
```

#### For some penguins, their sex is listed as `NA`. Where do these penguins occur?


```r
penguins%>%
  group_by(island)%>%
  summarize(number_NAs=sum(is.na(sex)),)
```

```
## `summarise()` ungrouping output (override with `.groups` argument)
```

```
## # A tibble: 3 x 2
##   island    number_NAs
##   <fct>          <int>
## 1 Biscoe             5
## 2 Dream              1
## 3 Torgersen          5
```


```r
penguins%>%
  summarize(distinct_species=n_distinct(species),
            distinct_island=n_distinct(island),
            distinct_sex=n_distinct(sex))
```

```
## # A tibble: 1 x 3
##   distinct_species distinct_island distinct_sex
##              <int>           <int>        <int>
## 1                3               3            3
```

```r
penguins%>%
  summarize(across(c(species,island,sex),n_distinct))
```

```
## # A tibble: 1 x 3
##   species island   sex
##     <int>  <int> <int>
## 1       3      3     3
```


```r
penguins%>%
  summarize(across(contains("mm"),mean,na.rm=T))
```

```
## # A tibble: 1 x 3
##   bill_length_mm bill_depth_mm flipper_length_mm
##            <dbl>         <dbl>             <dbl>
## 1           43.9          17.2              201.
```


```r
penguins%>%
  group_by(sex)%>%
  summarize(across(contains("mm"), mean, na.rm=T))
```

```
## `summarise()` ungrouping output (override with `.groups` argument)
```

```
## # A tibble: 3 x 4
##   sex    bill_length_mm bill_depth_mm flipper_length_mm
##   <fct>           <dbl>         <dbl>             <dbl>
## 1 female           42.1          16.4              197.
## 2 male             45.9          17.9              205.
## 3 <NA>             41.3          16.6              199
```

```r
penguins%>%
  summarise_all(n_distinct)
```

```
## # A tibble: 1 x 8
##   species island bill_length_mm bill_depth_mm flipper_length_~ body_mass_g   sex
##     <int>  <int>          <int>         <int>            <int>       <int> <int>
## 1       3      3            165            81               56          95     3
## # ... with 1 more variable: year <int>
```


```r
penguins%>%
  summarize(across(!c(species,island,sex),
                   n_distinct))
```

```
## # A tibble: 1 x 5
##   bill_length_mm bill_depth_mm flipper_length_mm body_mass_g  year
##            <int>         <int>             <int>       <int> <int>
## 1            165            81                56          95     3
```

```r
penguins%>%
  summarise(across(starts_with("bill"),n_distinct))
```

```
## # A tibble: 1 x 2
##   bill_length_mm bill_depth_mm
##            <int>         <int>
## 1            165            81
```

#Practice
#### Produce separate summaries of the mean and standard deviation for bill_length_mm, bill_depth_mm, and fliper_length_mm for each penguin species. Be sure to provide the number of samples. 


```r
penguins%>%
  group_by(species)%>%
  summarize(across(contains("mm"), mean, na.rm=T),
            n=n())
```

```
## `summarise()` ungrouping output (override with `.groups` argument)
```

```
## # A tibble: 3 x 5
##   species   bill_length_mm bill_depth_mm flipper_length_mm     n
##   <fct>              <dbl>         <dbl>             <dbl> <int>
## 1 Adelie              38.8          18.3              190.   152
## 2 Chinstrap           48.8          18.4              196.    68
## 3 Gentoo              47.5          15.0              217.   124
```


```r
penguins%>%
  group_by(species)%>%
  summarize(across(contains("mm"), sd, na.rm=T),
            n=n())
```

```
## `summarise()` ungrouping output (override with `.groups` argument)
```

```
## # A tibble: 3 x 5
##   species   bill_length_mm bill_depth_mm flipper_length_mm     n
##   <fct>              <dbl>         <dbl>             <dbl> <int>
## 1 Adelie              2.66         1.22               6.54   152
## 2 Chinstrap           3.34         1.14               7.13    68
## 3 Gentoo              3.08         0.981              6.48   124
```

