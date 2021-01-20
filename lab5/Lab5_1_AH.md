---
title: "Lab 5_1 AH"
author: "Aryss Hearne"
date: "1/19/2021"
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
fish <- readr::read_csv("data/Gaeta_etal_CLC_data.csv")
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
glimpse(fish)
```

```
## Rows: 4,033
## Columns: 6
## $ lakeid          <chr> "AL", "AL", "AL", "AL", "AL", "AL", "AL", "AL", "AL...
## $ fish_id         <dbl> 299, 299, 299, 300, 300, 300, 300, 301, 301, 301, 3...
## $ annnumber       <chr> "EDGE", "2", "1", "EDGE", "3", "2", "1", "EDGE", "3...
## $ length          <dbl> 167, 167, 167, 175, 175, 175, 175, 194, 194, 194, 1...
## $ radii_length_mm <dbl> 2.697443, 2.037518, 1.311795, 3.015477, 2.670733, 2...
## $ scalelength     <dbl> 2.697443, 2.697443, 2.697443, 3.015477, 3.015477, 3...
```

```r
mammals<-readr::read_csv("data/mammal_lifehistories_v2.csv")
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
glimpse(mammals)
```

```
## Rows: 1,440
## Columns: 13
## $ order          <chr> "Artiodactyla", "Artiodactyla", "Artiodactyla", "Art...
## $ family         <chr> "Antilocapridae", "Bovidae", "Bovidae", "Bovidae", "...
## $ Genus          <chr> "Antilocapra", "Addax", "Aepyceros", "Alcelaphus", "...
## $ species        <chr> "americana", "nasomaculatus", "melampus", "buselaphu...
## $ mass           <dbl> 45375.0, 182375.0, 41480.0, 150000.0, 28500.0, 55500...
## $ gestation      <dbl> 8.13, 9.39, 6.35, 7.90, 6.80, 5.08, 5.72, 5.50, 8.93...
## $ newborn        <dbl> 3246.36, 5480.00, 5093.00, 10166.67, -999.00, 3810.0...
## $ weaning        <dbl> 3.00, 6.50, 5.63, 6.50, -999.00, 4.00, 4.04, 2.13, 1...
## $ `wean mass`    <dbl> 8900, -999, 15900, -999, -999, -999, -999, -999, 157...
## $ AFR            <dbl> 13.53, 27.27, 16.66, 23.02, -999.00, 14.89, 10.23, 2...
## $ `max. life`    <dbl> 142, 308, 213, 240, -999, 251, 228, 255, 300, 324, 3...
## $ `litter size`  <dbl> 1.85, 1.00, 1.00, 1.00, 1.00, 1.37, 1.00, 1.00, 1.00...
## $ `litters/year` <dbl> 1.00, 0.99, 0.95, -999.00, -999.00, 2.00, -999.00, 1...
```

```r
mammals<-rename(mammals, genus="Genus", wean_mass="wean mass", max_life="max. life", litter_size="litter size", litters_per_year="litters/year")
```



```r
fish %>%
  select(lakeid, scalelength)%>%
  filter(lakeid=="AL")
```

```
## # A tibble: 383 x 2
##    lakeid scalelength
##    <chr>        <dbl>
##  1 AL            2.70
##  2 AL            2.70
##  3 AL            2.70
##  4 AL            3.02
##  5 AL            3.02
##  6 AL            3.02
##  7 AL            3.02
##  8 AL            3.34
##  9 AL            3.34
## 10 AL            3.34
## # ... with 373 more rows
```

```r
mammals%>%
  select(family, genus, species, gestation)%>%
  filter(gestation>=15)
```

```
## # A tibble: 8 x 4
##   family         genus         species       gestation
##   <chr>          <chr>         <chr>             <dbl>
## 1 Delphinidae    Globicephala  macrorhynchus      15.2
## 2 Physeteridae   Physeter      catodon            15.8
## 3 Rhinocerotidae Ceratotherium simum              15.9
## 4 Rhinocerotidae Diceros       bicornis           16.1
## 5 Rhinocerotidae Rhinoceros    unicornis          16.4
## 6 Rhinocerotidae Rhinoceros    sondaicus          16.5
## 7 Elephantidae   Elephas       maximus            21.1
## 8 Elephantidae   Loxodonta     africana           21.5
```


```r
fish%>%
  select(lakeid, radii_length_mm)%>%
  filter(lakeid=="AL" | lakeid=="AR")%>%
  filter(radii_length_mm>=2 & radii_length_mm<=4)
```

```
## # A tibble: 253 x 2
##    lakeid radii_length_mm
##    <chr>            <dbl>
##  1 AL                2.70
##  2 AL                2.04
##  3 AL                3.02
##  4 AL                2.67
##  5 AL                2.14
##  6 AL                3.34
##  7 AL                2.97
##  8 AL                2.29
##  9 AL                3.72
## 10 AL                3.23
## # ... with 243 more rows
```


```r
fish %>%
  arrange(scalelength)
```

```
## # A tibble: 4,033 x 6
##    lakeid fish_id annnumber length radii_length_mm scalelength
##    <chr>    <dbl> <chr>      <dbl>           <dbl>       <dbl>
##  1 WS         151 EDGE          58           0.628       0.628
##  2 WS         153 EDGE          78           0.637       0.637
##  3 LSG         59 EDGE          64           0.773       0.773
##  4 WS         152 EDGE          74           0.832       0.832
##  5 LSG         58 EDGE          92           1.15        1.15 
##  6 WS         155 EDGE         128           1.41        1.41 
##  7 WS         155 2            128           1.16        1.41 
##  8 WS         155 1            128           0.579       1.41 
##  9 BO         391 EDGE         107           1.43        1.43 
## 10 BO         391 1            107           0.695       1.43 
## # ... with 4,023 more rows
```


```r
fish %>%
  arrange(desc(scalelength))
```

```
## # A tibble: 4,033 x 6
##    lakeid fish_id annnumber length radii_length_mm scalelength
##    <chr>    <dbl> <chr>      <dbl>           <dbl>       <dbl>
##  1 WS         180 EDGE         403           11.0         11.0
##  2 WS         180 16           403           10.6         11.0
##  3 WS         180 15           403           10.3         11.0
##  4 WS         180 14           403            9.93        11.0
##  5 WS         180 13           403            9.56        11.0
##  6 WS         180 12           403            9.17        11.0
##  7 WS         180 11           403            8.62        11.0
##  8 WS         180 10           403            8.15        11.0
##  9 WS         180 9            403            7.49        11.0
## 10 WS         180 8            403            6.97        11.0
## # ... with 4,023 more rows
```


```r
fish %>%
  select(lakeid, length, fish_id, scalelength) %>%
  filter(lakeid=="AL")%>%
  arrange(fish_id)
```

```
## # A tibble: 383 x 4
##    lakeid length fish_id scalelength
##    <chr>   <dbl>   <dbl>       <dbl>
##  1 AL        167     299        2.70
##  2 AL        167     299        2.70
##  3 AL        167     299        2.70
##  4 AL        175     300        3.02
##  5 AL        175     300        3.02
##  6 AL        175     300        3.02
##  7 AL        175     300        3.02
##  8 AL        194     301        3.34
##  9 AL        194     301        3.34
## 10 AL        194     301        3.34
## # ... with 373 more rows
```

```r
fish%>%
  select(lakeid, fish_id, radii_length_mm, scalelength)%>%
  filter(fish_id==300)%>%
  arrange(radii_length_mm)
```

```
## # A tibble: 4 x 4
##   lakeid fish_id radii_length_mm scalelength
##   <chr>    <dbl>           <dbl>       <dbl>
## 1 AL         300            1.23        3.02
## 2 AL         300            2.14        3.02
## 3 AL         300            2.67        3.02
## 4 AL         300            3.02        3.02
```


```r
fish%>%
  mutate(length_mm=length*10)%>%
  select(fish_id, length, length_mm)
```

```
## # A tibble: 4,033 x 3
##    fish_id length length_mm
##      <dbl>  <dbl>     <dbl>
##  1     299    167      1670
##  2     299    167      1670
##  3     299    167      1670
##  4     300    175      1750
##  5     300    175      1750
##  6     300    175      1750
##  7     300    175      1750
##  8     301    194      1940
##  9     301    194      1940
## 10     301    194      1940
## # ... with 4,023 more rows
```


```r
mammals
```

```
## # A tibble: 1,440 x 13
##    order family genus species   mass gestation newborn weaning wean_mass    AFR
##    <chr> <chr>  <chr> <chr>    <dbl>     <dbl>   <dbl>   <dbl>     <dbl>  <dbl>
##  1 Arti~ Antil~ Anti~ americ~ 4.54e4      8.13   3246.    3         8900   13.5
##  2 Arti~ Bovid~ Addax nasoma~ 1.82e5      9.39   5480     6.5       -999   27.3
##  3 Arti~ Bovid~ Aepy~ melamp~ 4.15e4      6.35   5093     5.63     15900   16.7
##  4 Arti~ Bovid~ Alce~ busela~ 1.50e5      7.9   10167.    6.5       -999   23.0
##  5 Arti~ Bovid~ Ammo~ clarkei 2.85e4      6.8    -999  -999         -999 -999  
##  6 Arti~ Bovid~ Ammo~ lervia  5.55e4      5.08   3810     4         -999   14.9
##  7 Arti~ Bovid~ Anti~ marsup~ 3.00e4      5.72   3910     4.04      -999   10.2
##  8 Arti~ Bovid~ Anti~ cervic~ 3.75e4      5.5    3846     2.13      -999   20.1
##  9 Arti~ Bovid~ Bison bison   4.98e5      8.93  20000    10.7     157500   29.4
## 10 Arti~ Bovid~ Bison bonasus 5.00e5      9.14  23000.    6.6       -999   30.0
## # ... with 1,430 more rows, and 3 more variables: max_life <dbl>,
## #   litter_size <dbl>, litters_per_year <dbl>
```

```r
mammals%>%
  mutate_all(tolower)
```

```
## # A tibble: 1,440 x 13
##    order family genus species mass  gestation newborn weaning wean_mass AFR  
##    <chr> <chr>  <chr> <chr>   <chr> <chr>     <chr>   <chr>   <chr>     <chr>
##  1 arti~ antil~ anti~ americ~ 45375 8.13      3246.36 3       8900      13.53
##  2 arti~ bovid~ addax nasoma~ 1823~ 9.39      5480    6.5     -999      27.27
##  3 arti~ bovid~ aepy~ melamp~ 41480 6.35      5093    5.63    15900     16.66
##  4 arti~ bovid~ alce~ busela~ 1500~ 7.9       10166.~ 6.5     -999      23.02
##  5 arti~ bovid~ ammo~ clarkei 28500 6.8       -999    -999    -999      -999 
##  6 arti~ bovid~ ammo~ lervia  55500 5.08      3810    4       -999      14.89
##  7 arti~ bovid~ anti~ marsup~ 30000 5.72      3910    4.04    -999      10.23
##  8 arti~ bovid~ anti~ cervic~ 37500 5.5       3846    2.13    -999      20.13
##  9 arti~ bovid~ bison bison   4976~ 8.93      20000   10.71   157500    29.45
## 10 arti~ bovid~ bison bonasus 5e+05 9.14      23000.~ 6.6     -999      29.99
## # ... with 1,430 more rows, and 3 more variables: max_life <chr>,
## #   litter_size <chr>, litters_per_year <chr>
```
 

```r
mammals%>%
  select(genus, species, newborn)%>%
  arrange(newborn)
```

```
## # A tibble: 1,440 x 3
##    genus       species        newborn
##    <chr>       <chr>            <dbl>
##  1 Ammodorcas  clarkei           -999
##  2 Bos         javanicus         -999
##  3 Bubalus     depressicornis    -999
##  4 Bubalus     mindorensis       -999
##  5 Capra       falconeri         -999
##  6 Cephalophus niger             -999
##  7 Cephalophus nigrifrons        -999
##  8 Cephalophus natalensis        -999
##  9 Cephalophus leucogaster       -999
## 10 Cephalophus ogilbyi           -999
## # ... with 1,430 more rows
```
 

```r
mammals %>%
  select(genus, species, newborn)%>%
  mutate(newborn_new = ifelse(newborn== -999.00, NA, newborn))
```

```
## # A tibble: 1,440 x 4
##    genus       species       newborn newborn_new
##    <chr>       <chr>           <dbl>       <dbl>
##  1 Antilocapra americana       3246.       3246.
##  2 Addax       nasomaculatus   5480        5480 
##  3 Aepyceros   melampus        5093        5093 
##  4 Alcelaphus  buselaphus     10167.      10167.
##  5 Ammodorcas  clarkei         -999          NA 
##  6 Ammotragus  lervia          3810        3810 
##  7 Antidorcas  marsupialis     3910        3910 
##  8 Antilope    cervicapra      3846        3846 
##  9 Bison       bison          20000       20000 
## 10 Bison       bonasus        23000.      23000.
## # ... with 1,430 more rows
```
 

```r
fish
```

```
## # A tibble: 4,033 x 6
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
## # ... with 4,023 more rows
```
 

```r
fish%>%
  mutate(length_half= length/2)%>%
  select(fish_id, length, length_half)
```

```
## # A tibble: 4,033 x 3
##    fish_id length length_half
##      <dbl>  <dbl>       <dbl>
##  1     299    167        83.5
##  2     299    167        83.5
##  3     299    167        83.5
##  4     300    175        87.5
##  5     300    175        87.5
##  6     300    175        87.5
##  7     300    175        87.5
##  8     301    194        97  
##  9     301    194        97  
## 10     301    194        97  
## # ... with 4,023 more rows
```
 
 

```r
mammals %>%
  select(family, genus, species, max_life)%>%
  mutate(max_life_new = ifelse(max_life==-999.0, NA, max_life))%>%
  select(family, genus, species, max_life_new)%>%
  arrange(desc(max_life_new))
```

```
## # A tibble: 1,440 x 4
##    family          genus        species      max_life_new
##    <chr>           <chr>        <chr>               <dbl>
##  1 Balaenopteridae Balaenoptera physalus             1368
##  2 Balaenopteridae Balaenoptera musculus             1320
##  3 Balaenidae      Balaena      mysticetus           1200
##  4 Delphinidae     Orcinus      orca                 1080
##  5 Ziphiidae       Berardius    bairdii              1008
##  6 Elephantidae    Elephas      maximus               960
##  7 Balaenopteridae Megaptera    novaeangliae          924
##  8 Physeteridae    Physeter     catodon               924
##  9 Balaenopteridae Balaenoptera borealis              888
## 10 Dugongidae      Dugong       dugon                 876
## # ... with 1,430 more rows
```
 
*the Balaenopteridae Balaenoptera Physalus is the oldest known life span at 1368 years.*
 
