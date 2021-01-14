---
title: "4_2_AH"
author: "Aryss Hearne"
date: "1/14/2021"
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
fish<-readr::read_csv("data/Gaeta_etal_CLC_data.csv")
```

```
## 
## -- Column specification --------------------------------------------------------
## cols(
##   lakeid = col_character(),
##   fish_id = col_double(),
##   annnumber = col_character(),
##   length = col_double(),
##   radii_length_mm = col_double(),
##   scalelength = col_double()
## )
```


```r
mammals <- readr::read_csv("data/mammal_lifehistories_v2.csv")
```

```
## 
## -- Column specification --------------------------------------------------------
## cols(
##   order = col_character(),
##   family = col_character(),
##   Genus = col_character(),
##   species = col_character(),
##   mass = col_double(),
##   gestation = col_double(),
##   newborn = col_double(),
##   weaning = col_double(),
##   `wean mass` = col_double(),
##   AFR = col_double(),
##   `max. life` = col_double(),
##   `litter size` = col_double(),
##   `litters/year` = col_double()
## )
```


```r
mammals <- rename(mammals, genus=Genus, wean_mass="wean mass", max_life="max. life", litter_size="litter size", litters_per_year="litters/year")
```


```r
filter(fish, lakeid =="AL")
```

```
## # A tibble: 383 x 6
##    lakeid fish_id annnumber length radii_length_mm scalelength
##    <chr>    <dbl> <chr>      <dbl>           <dbl>       <dbl>
##  1 AL         299 EDGE         167            2.70        2.70
##  2 AL         299 2            167            2.04        2.70
##  3 AL         299 1            167            1.31        2.70
##  4 AL         300 EDGE         175            3.02        3.02
##  5 AL         300 3            175            2.67        3.02
##  6 AL         300 2            175            2.14        3.02
##  7 AL         300 1            175            1.23        3.02
##  8 AL         301 EDGE         194            3.34        3.34
##  9 AL         301 3            194            2.97        3.34
## 10 AL         301 2            194            2.29        3.34
## # ... with 373 more rows
```


```r
filter(fish, length>=350)
```

```
## # A tibble: 890 x 6
##    lakeid fish_id annnumber length radii_length_mm scalelength
##    <chr>    <dbl> <chr>      <dbl>           <dbl>       <dbl>
##  1 AL         306 EDGE         350            6.94        6.94
##  2 AL         306 10           350            6.46        6.94
##  3 AL         306 9            350            6.16        6.94
##  4 AL         306 8            350            5.88        6.94
##  5 AL         306 7            350            5.42        6.94
##  6 AL         306 6            350            4.90        6.94
##  7 AL         306 5            350            4.46        6.94
##  8 AL         306 4            350            3.75        6.94
##  9 AL         306 3            350            2.93        6.94
## 10 AL         306 2            350            2.14        6.94
## # ... with 880 more rows
```


```r
filter(fish, lakeid!="AL")
```

```
## # A tibble: 3,650 x 6
##    lakeid fish_id annnumber length radii_length_mm scalelength
##    <chr>    <dbl> <chr>      <dbl>           <dbl>       <dbl>
##  1 AR         269 EDGE         140            2.01        2.01
##  2 AR         269 1            140            1.48        2.01
##  3 AR         270 EDGE         193            2.66        2.66
##  4 AR         270 3            193            2.39        2.66
##  5 AR         270 2            193            2.03        2.66
##  6 AR         270 1            193            1.42        2.66
##  7 AR         271 EDGE         220            3.50        3.50
##  8 AR         271 5            220            3.13        3.50
##  9 AR         271 4            220            2.86        3.50
## 10 AR         271 3            220            2.63        3.50
## # ... with 3,640 more rows
```


```r
filter(fish, length%in% c(167,175))
```

```
## # A tibble: 18 x 6
##    lakeid fish_id annnumber length radii_length_mm scalelength
##    <chr>    <dbl> <chr>      <dbl>           <dbl>       <dbl>
##  1 AL         299 EDGE         167           2.70         2.70
##  2 AL         299 2            167           2.04         2.70
##  3 AL         299 1            167           1.31         2.70
##  4 AL         300 EDGE         175           3.02         3.02
##  5 AL         300 3            175           2.67         3.02
##  6 AL         300 2            175           2.14         3.02
##  7 AL         300 1            175           1.23         3.02
##  8 BO         397 EDGE         175           2.67         2.67
##  9 BO         397 3            175           2.39         2.67
## 10 BO         397 2            175           1.59         2.67
## 11 BO         397 1            175           0.830        2.67
## 12 LSG         45 EDGE         175           3.21         3.21
## 13 LSG         45 3            175           2.92         3.21
## 14 LSG         45 2            175           2.44         3.21
## 15 LSG         45 1            175           1.60         3.21
## 16 RD         103 EDGE         167           2.80         2.80
## 17 RD         103 2            167           2.10         2.80
## 18 RD         103 1            167           1.31         2.80
```


```r
filter(fish, between(scalelength, 2.5, 2.55))
```

```
## # A tibble: 10 x 6
##    lakeid fish_id annnumber length radii_length_mm scalelength
##    <chr>    <dbl> <chr>      <dbl>           <dbl>       <dbl>
##  1 LSG         56 EDGE         145            2.55        2.55
##  2 LSG         56 2            145            1.94        2.55
##  3 LSG         56 1            145            1.20        2.55
##  4 LSG         57 EDGE         143            2.52        2.52
##  5 LSG         57 2            143            2.13        2.52
##  6 LSG         57 1            143            1.19        2.52
##  7 UB          80 EDGE         153            2.55        2.55
##  8 UB          80 3            153            2.10        2.55
##  9 UB          80 2            153            1.62        2.55
## 10 UB          80 1            153            1.14        2.55
```


```r
filter(fish, near(radii_length_mm, 2, tol=0.2))
```

```
## # A tibble: 291 x 6
##    lakeid fish_id annnumber length radii_length_mm scalelength
##    <chr>    <dbl> <chr>      <dbl>           <dbl>       <dbl>
##  1 AL         299 2            167            2.04        2.70
##  2 AL         300 2            175            2.14        3.02
##  3 AL         302 2            324            2.19        6.07
##  4 AL         303 2            325            2.04        6.79
##  5 AL         306 2            350            2.14        6.94
##  6 AL         308 2            355            1.86        6.67
##  7 AL         312 2            367            2.17        6.81
##  8 AL         313 2            367            2.06        6.47
##  9 AL         315 2            372            2.04        6.47
## 10 AL         316 2            372            1.82        6.35
## # ... with 281 more rows
```


```r
filter(fish, lakeid=="BO")
```

```
## # A tibble: 197 x 6
##    lakeid fish_id annnumber length radii_length_mm scalelength
##    <chr>    <dbl> <chr>      <dbl>           <dbl>       <dbl>
##  1 BO         389 EDGE         104           1.50         1.50
##  2 BO         389 1            104           0.736        1.50
##  3 BO         390 EDGE         105           1.59         1.59
##  4 BO         390 1            105           0.698        1.59
##  5 BO         391 EDGE         107           1.43         1.43
##  6 BO         391 1            107           0.695        1.43
##  7 BO         392 EDGE         124           2.11         2.11
##  8 BO         392 2            124           1.36         2.11
##  9 BO         392 1            124           0.792        2.11
## 10 BO         393 EDGE         141           2.16         2.16
## # ... with 187 more rows
```


```r
filter(fish, lakeid!="AR")
```

```
## # A tibble: 3,771 x 6
##    lakeid fish_id annnumber length radii_length_mm scalelength
##    <chr>    <dbl> <chr>      <dbl>           <dbl>       <dbl>
##  1 AL         299 EDGE         167            2.70        2.70
##  2 AL         299 2            167            2.04        2.70
##  3 AL         299 1            167            1.31        2.70
##  4 AL         300 EDGE         175            3.02        3.02
##  5 AL         300 3            175            2.67        3.02
##  6 AL         300 2            175            2.14        3.02
##  7 AL         300 1            175            1.23        3.02
##  8 AL         301 EDGE         194            3.34        3.34
##  9 AL         301 3            194            2.97        3.34
## 10 AL         301 2            194            2.29        3.34
## # ... with 3,761 more rows
```


```r
filter(fish, near(scalelength, 8, tol=0.25))
```

```
## # A tibble: 236 x 6
##    lakeid fish_id annnumber length radii_length_mm scalelength
##    <chr>    <dbl> <chr>      <dbl>           <dbl>       <dbl>
##  1 AL         309 EDGE         355            7.89        7.89
##  2 AL         309 13           355            7.56        7.89
##  3 AL         309 12           355            7.36        7.89
##  4 AL         309 11           355            7.16        7.89
##  5 AL         309 10           355            6.77        7.89
##  6 AL         309 9            355            6.39        7.89
##  7 AL         309 8            355            5.96        7.89
##  8 AL         309 7            355            5.44        7.89
##  9 AL         309 6            355            4.74        7.89
## 10 AL         309 5            355            4.06        7.89
## # ... with 226 more rows
```


```r
filter(fish, between(scalelength, 2, 4))
```

```
## # A tibble: 723 x 6
##    lakeid fish_id annnumber length radii_length_mm scalelength
##    <chr>    <dbl> <chr>      <dbl>           <dbl>       <dbl>
##  1 AL         299 EDGE         167            2.70        2.70
##  2 AL         299 2            167            2.04        2.70
##  3 AL         299 1            167            1.31        2.70
##  4 AL         300 EDGE         175            3.02        3.02
##  5 AL         300 3            175            2.67        3.02
##  6 AL         300 2            175            2.14        3.02
##  7 AL         300 1            175            1.23        3.02
##  8 AL         301 EDGE         194            3.34        3.34
##  9 AL         301 3            194            2.97        3.34
## 10 AL         301 2            194            2.29        3.34
## # ... with 713 more rows
```


```r
filter(fish, lakeid=="AL" & length>350)
```

```
## # A tibble: 314 x 6
##    lakeid fish_id annnumber length radii_length_mm scalelength
##    <chr>    <dbl> <chr>      <dbl>           <dbl>       <dbl>
##  1 AL         307 EDGE         353            7.55        7.55
##  2 AL         307 13           353            7.28        7.55
##  3 AL         307 12           353            6.98        7.55
##  4 AL         307 11           353            6.73        7.55
##  5 AL         307 10           353            6.48        7.55
##  6 AL         307 9            353            6.22        7.55
##  7 AL         307 8            353            5.92        7.55
##  8 AL         307 7            353            5.44        7.55
##  9 AL         307 6            353            5.06        7.55
## 10 AL         307 5            353            4.37        7.55
## # ... with 304 more rows
```


```r
filter(fish, lakeid=="AL" | length > 350)
```

```
## # A tibble: 948 x 6
##    lakeid fish_id annnumber length radii_length_mm scalelength
##    <chr>    <dbl> <chr>      <dbl>           <dbl>       <dbl>
##  1 AL         299 EDGE         167            2.70        2.70
##  2 AL         299 2            167            2.04        2.70
##  3 AL         299 1            167            1.31        2.70
##  4 AL         300 EDGE         175            3.02        3.02
##  5 AL         300 3            175            2.67        3.02
##  6 AL         300 2            175            2.14        3.02
##  7 AL         300 1            175            1.23        3.02
##  8 AL         301 EDGE         194            3.34        3.34
##  9 AL         301 3            194            2.97        3.34
## 10 AL         301 2            194            2.29        3.34
## # ... with 938 more rows
```


```r
glimpse(mammals)
```

```
## Rows: 1,440
## Columns: 13
## $ order            <chr> "Artiodactyla", "Artiodactyla", "Artiodactyla", "A...
## $ family           <chr> "Antilocapridae", "Bovidae", "Bovidae", "Bovidae",...
## $ genus            <chr> "Antilocapra", "Addax", "Aepyceros", "Alcelaphus",...
## $ species          <chr> "americana", "nasomaculatus", "melampus", "buselap...
## $ mass             <dbl> 45375.0, 182375.0, 41480.0, 150000.0, 28500.0, 555...
## $ gestation        <dbl> 8.13, 9.39, 6.35, 7.90, 6.80, 5.08, 5.72, 5.50, 8....
## $ newborn          <dbl> 3246.36, 5480.00, 5093.00, 10166.67, -999.00, 3810...
## $ weaning          <dbl> 3.00, 6.50, 5.63, 6.50, -999.00, 4.00, 4.04, 2.13,...
## $ wean_mass        <dbl> 8900, -999, 15900, -999, -999, -999, -999, -999, 1...
## $ AFR              <dbl> 13.53, 27.27, 16.66, 23.02, -999.00, 14.89, 10.23,...
## $ max_life         <dbl> 142, 308, 213, 240, -999, 251, 228, 255, 300, 324,...
## $ litter_size      <dbl> 1.85, 1.00, 1.00, 1.00, 1.00, 1.37, 1.00, 1.00, 1....
## $ litters_per_year <dbl> 1.00, 0.99, 0.95, -999.00, -999.00, 2.00, -999.00,...
```


```r
names(mammals)
```

```
##  [1] "order"            "family"           "genus"            "species"         
##  [5] "mass"             "gestation"        "newborn"          "weaning"         
##  [9] "wean_mass"        "AFR"              "max_life"         "litter_size"     
## [13] "litters_per_year"
```


```r
filter(mammals, family=="Bovidae"&mass>=450000)
```

```
## # A tibble: 7 x 13
##   order family genus species   mass gestation newborn weaning wean_mass   AFR
##   <chr> <chr>  <chr> <chr>    <dbl>     <dbl>   <dbl>   <dbl>     <dbl> <dbl>
## 1 Arti~ Bovid~ Bison bison   4.98e5      8.93  20000    10.7     157500  29.4
## 2 Arti~ Bovid~ Bison bonasus 5.00e5      9.14  23000.    6.6       -999  30.0
## 3 Arti~ Bovid~ Bos   fronta~ 8.00e5      9.02  23033.    4.5       -999  24.2
## 4 Arti~ Bovid~ Bos   javani~ 6.67e5      9.83   -999     9.5       -999  25.5
## 5 Arti~ Bovid~ Buba~ bubalis 9.50e5     10.5   37500     7.5       -999  19.9
## 6 Arti~ Bovid~ Sync~ caffer  5.05e5     11.0   42862.    9.18    166000  47.9
## 7 Arti~ Bovid~ Taur~ derbia~ 6.80e5      8.67   -999  -999         -999  36.4
## # ... with 3 more variables: max_life <dbl>, litter_size <dbl>,
## #   litters_per_year <dbl>
```


```r
select(mammals, genus,mass,gestation,newborn)
```

```
## # A tibble: 1,440 x 4
##    genus          mass gestation newborn
##    <chr>         <dbl>     <dbl>   <dbl>
##  1 Antilocapra  45375       8.13   3246.
##  2 Addax       182375       9.39   5480 
##  3 Aepyceros    41480       6.35   5093 
##  4 Alcelaphus  150000       7.9   10167.
##  5 Ammodorcas   28500       6.8    -999 
##  6 Ammotragus   55500       5.08   3810 
##  7 Antidorcas   30000       5.72   3910 
##  8 Antilope     37500       5.5    3846 
##  9 Bison       497667.      8.93  20000 
## 10 Bison       500000       9.14  23000.
## # ... with 1,430 more rows
```

```r
filter(mammals, genus=="Lophocebus"| genus=="Erythrocebus"| genus=="Macaca")
```

```
## # A tibble: 15 x 13
##    order family genus species   mass gestation newborn weaning wean_mass    AFR
##    <chr> <chr>  <chr> <chr>    <dbl>     <dbl>   <dbl>   <dbl>     <dbl>  <dbl>
##  1 Prim~ Cerco~ Eryt~ patas    5883.      5.56    546.    5.33     1950    32.8
##  2 Prim~ Cerco~ Loph~ albige~  6726.      5.97    462.    7.67     2170    57.6
##  3 Prim~ Cerco~ Maca~ thibet~ 10037.      5.67    533.   18.8      2400  -999  
##  4 Prim~ Cerco~ Maca~ fuscata  8858.      5.72    505.   12.1      1768.   55.0
##  5 Prim~ Cerco~ Maca~ maura    5575       5.43    390.   16.7      -999    60  
##  6 Prim~ Cerco~ Maca~ sylvan~  9753.      5.49    450     7        2420    49.8
##  7 Prim~ Cerco~ Maca~ arctoi~  7308.      6       486.   11.2      2300    47.8
##  8 Prim~ Cerco~ Maca~ nigra    6212.      5.78    458.    7        -999    63.2
##  9 Prim~ Cerco~ Maca~ sinica   3495    -999       446    13.0      -999    54  
## 10 Prim~ Cerco~ Maca~ silenus  4875       5.94    418    12        -999    53.2
## 11 Prim~ Cerco~ Maca~ mulatta  5413.      5.47    476.    9.47     1454    41.1
## 12 Prim~ Cerco~ Maca~ cyclop~  6317.      5.4     401     6.87     -999  -999  
## 13 Prim~ Cerco~ Maca~ nemest~  6133.      5.71    476.   10.7      1416.   43.6
## 14 Prim~ Cerco~ Maca~ fascic~  3456.      5.49    408.    9.58      990.   43.6
## 15 Prim~ Cerco~ Maca~ radiata  3735       5.43    391.   10.7      2000    45.4
## # ... with 3 more variables: max_life <dbl>, litter_size <dbl>,
## #   litters_per_year <dbl>
```


```r
x<-select(mammals, genus,mass,gestation,newborn)
y<-filter(x, genus=="Lophocebus"| genus=="Erythrocebus"| genus=="Macaca")
min(y$newborn)
```

```
## [1] 389.5
```

*Cercopithecidae Macaca Maura has the smallest newborn weight*
