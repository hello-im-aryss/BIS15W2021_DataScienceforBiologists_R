---
title: "Lab 3_1"
author: "Aryss Hearne"
date: "1/12/2021"
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
temp <- c(36.25, 35.40, 35.30, 35.15, 35.35, 33.35, 30.70, 29.65, 29.20)
name <- c("Jill", "Susan", "Steve", "Jill", "Susan", "Steve", "Jill", "Susan", "Steve")
spring <- c("Buckeye", "Buckeye", "Buckeye", "Benton", "Benton", "Benton", "Travertine", "Travertine", "Travertine")
```

##### 1. Build a data frame called `hsprings` with the above data. Name the temperature column `temp_C.` Print out the data frame.


```r
hsprings <- data.frame(spring, name, temp)
hsprings <- data.frame(spring, name, temp_c = temp)
hsprings
```

```
##       spring  name temp_c
## 1    Buckeye  Jill  36.25
## 2    Buckeye Susan  35.40
## 3    Buckeye Steve  35.30
## 4     Benton  Jill  35.15
## 5     Benton Susan  35.35
## 6     Benton Steve  33.35
## 7 Travertine  Jill  30.70
## 8 Travertine Susan  29.65
## 9 Travertine Steve  29.20
```
##### 2. Change the column titled `name` to `scientist`, leave the other column names the same. Print out the data frame names.


```r
hsprings <- data.frame(spring, scientist = name, temp_c = temp)
hsprings
```

```
##       spring scientist temp_c
## 1    Buckeye      Jill  36.25
## 2    Buckeye     Susan  35.40
## 3    Buckeye     Steve  35.30
## 4     Benton      Jill  35.15
## 5     Benton     Susan  35.35
## 6     Benton     Steve  33.35
## 7 Travertine      Jill  30.70
## 8 Travertine     Susan  29.65
## 9 Travertine     Steve  29.20
```
##### 3. Our scientists forgot to record the depth data for each spring. Here it is as a vector, add it as a new column called `depth_ft:` `c(4.15, 4.13, 4.12, 3.21, 3.23, 3.20, 5.67, 5.65, 5.66)`. Print out the data frame.


```r
hsprings$depth_ft <- c(4.15, 4.13, 4.12, 3.21, 3.23, 3.20, 5.67, 5.65, 5.66)
hsprings
```

```
##       spring scientist temp_c depth_ft
## 1    Buckeye      Jill  36.25     4.15
## 2    Buckeye     Susan  35.40     4.13
## 3    Buckeye     Steve  35.30     4.12
## 4     Benton      Jill  35.15     3.21
## 5     Benton     Susan  35.35     3.23
## 6     Benton     Steve  33.35     3.20
## 7 Travertine      Jill  30.70     5.67
## 8 Travertine     Susan  29.65     5.65
## 9 Travertine     Steve  29.20     5.66
```
##### 4. Calculate the mean temperature of all of the temperature measurements.


```r
w <- hsprings$temp_c
mean(w)
```

```
## [1] 33.37222
```
##### 5. Save your hot springs data as a `.csv` file! Do not allow row names.


```r
write.csv(hsprings, "hsprings_data.csv", row.names=FALSE)
```

