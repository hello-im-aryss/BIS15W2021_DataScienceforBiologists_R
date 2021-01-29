---
title: "Midterm 1"
author: "Aryss Hearne"
date: "2021-01-29"
output:
  html_document: 
    theme: spacelab
    keep_md: yes
---



## Instructions
Answer the following questions and complete the exercises in RMarkdown. Please embed all of your code and push your final work to your repository. Your code should be organized, clean, and run free from errors. Be sure to **add your name** to the author header above. You may use any resources to answer these questions (including each other), but you may not post questions to Open Stacks or external help sites. There are 12 total questions.  

Make sure to use the formatting conventions of RMarkdown to make your report neat and clean!  

This exam is due by **12:00p on Thursday, January 28**.  

## Load the tidyverse
If you plan to use any other libraries to complete this assignment then you should load them here.

```r
library(tidyverse)
library(janitor)
library(skimr)
```

## Questions
**1. (2 points) Briefly explain how R, RStudio, and GitHub work together to make work flows in data science transparent and repeatable. What is the advantage of using RMarkdown in this context?** 


```r
#R is a coding language with minimal interface functionality. RStudio takes that language and situates it in a shell with more functionality - so it expands the capabilities of R. GitHub is a  hosting service which allows the exchange and collaboration of code. RMarkdown allows us to write R within RStudio and share on Github where, with .md files, other users are able to read the code locally (instead of having to download and open their own session of RStudio). All of this comes together to allow folks to view the processes/ codes utilized by their fellow scientists and allows for replication. 
```


**2. (2 points) What are the three types of `data structures` that we have discussed? Why are we using data frames for BIS 15L?**


```r
#So far, we've discussed data vectors, data matrices, and data frames. Frames are the most user-friendly. They also interface well with the library functions we're currently using so the frame has additional functionality and can be manipulated in additional ways as compared to the more rudimentary matrix.  
```


In the midterm 1 folder there is a second folder called `data`. Inside the `data` folder, there is a .csv file called `ElephantsMF`. These data are from Phyllis Lee, Stirling University, and are related to Lee, P., et al. (2013), "Enduring consequences of early experiences: 40-year effects on survival and success among African elephants (Loxodonta africana)," Biology Letters, 9: 20130011. [kaggle](https://www.kaggle.com/mostafaelseidy/elephantsmf).  

**3. (2 points) Please load these data as a new object called `elephants`. Use the function(s) of your choice to get an idea of the structure of the data. Be sure to show the class of each variable.**


```r
elephant<-readr::read_csv("data/ElephantsMF.csv")
```

```
## 
## -- Column specification --------------------------------------------------------
## cols(
##   Age = col_double(),
##   Height = col_double(),
##   Sex = col_character()
## )
```

```r
glimpse(elephant)
```

```
## Rows: 288
## Columns: 3
## $ Age    <dbl> 1.40, 17.50, 12.75, 11.17, 12.67, 12.67, 12.25, 12.17, 28.17...
## $ Height <dbl> 120.00, 227.00, 235.00, 210.00, 220.00, 189.00, 225.00, 204....
## $ Sex    <chr> "M", "M", "M", "M", "M", "M", "M", "M", "M", "M", "M", "M", ...
```


**4. (2 points) Change the names of the variables to lower case and change the class of the variable `sex` to a factor.**


```r
elephants<-janitor::clean_names(elephant)
elephants$sex<-as.factor(elephants$sex)
elephants
```

```
## # A tibble: 288 x 3
##      age height sex  
##    <dbl>  <dbl> <fct>
##  1   1.4   120  M    
##  2  17.5   227  M    
##  3  12.8   235  M    
##  4  11.2   210  M    
##  5  12.7   220  M    
##  6  12.7   189  M    
##  7  12.2   225  M    
##  8  12.2   204  M    
##  9  28.2   266. M    
## 10  11.7   233  M    
## # ... with 278 more rows
```


**5. (2 points) How many male and female elephants are represented in the data?**


```r
names(elephants)
```

```
## [1] "age"    "height" "sex"
```



```r
elephants%>%
  count(sex)
```

```
## # A tibble: 2 x 2
##   sex       n
##   <fct> <int>
## 1 F       150
## 2 M       138
```


**6. (2 points) What is the average age all elephants in the data?**


```r
elephants%>%
  summarize(mean_age=mean(age))
```

```
## # A tibble: 1 x 1
##   mean_age
##      <dbl>
## 1     11.0
```


**7. (2 points) How does the average age and height of elephants compare by sex?**



```r
elephants%>%
  group_by(sex)%>%
  summarize(mean_age=mean(age),
            mean_height=mean(height),
            n=n())
```

```
## `summarise()` ungrouping output (override with `.groups` argument)
```

```
## # A tibble: 2 x 4
##   sex   mean_age mean_height     n
##   <fct>    <dbl>       <dbl> <int>
## 1 F        12.8         190.   150
## 2 M         8.95        185.   138
```


**8. (2 points) How does the average height of elephants compare by sex for individuals over 25 years old. Include the min and max height as well as the number of individuals in the sample as part of your analysis.**


```r
elephants%>%
  group_by(sex)%>%
  filter(age>=25)%>%
  summarize(mean_height=mean(height),
            min_height=min(height),
            max_height=max(height),
            n=n())
```

```
## `summarise()` ungrouping output (override with `.groups` argument)
```

```
## # A tibble: 2 x 5
##   sex   mean_height min_height max_height     n
##   <fct>       <dbl>      <dbl>      <dbl> <int>
## 1 F            233.       206.       278.    25
## 2 M            273.       237.       304.     8
```


For the next series of questions, we will use data from a study on vertebrate community composition and impacts from defaunation in [Gabon, Africa](https://en.wikipedia.org/wiki/Gabon). One thing to notice is that the data include 24 separate transects. Each transect represents a path through different forest management areas.  

Reference: Koerner SE, Poulsen JR, Blanchard EJ, Okouyi J, Clark CJ. Vertebrate community composition and diversity declines along a defaunation gradient radiating from rural villages in Gabon. _Journal of Applied Ecology_. 2016. This paper, along with a description of the variables is included inside the midterm 1 folder.  

**9. (2 points) Load `IvindoData_DryadVersion.csv` and use the function(s) of your choice to get an idea of the overall structure. Change the variables `HuntCat` and `LandUse` to factors.**


```r
a_gabon<-readr::read_csv("data/IvindoData_DryadVersion.csv")
```

```
## 
## -- Column specification --------------------------------------------------------
## cols(
##   .default = col_double(),
##   HuntCat = col_character(),
##   LandUse = col_character()
## )
## i Use `spec()` for the full column specifications.
```

```r
glimpse(a_gabon)
```

```
## Rows: 24
## Columns: 26
## $ TransectID              <dbl> 1, 2, 2, 3, 4, 5, 6, 7, 8, 9, 13, 14, 15, 1...
## $ Distance                <dbl> 7.14, 17.31, 18.32, 20.85, 15.95, 17.47, 24...
## $ HuntCat                 <chr> "Moderate", "None", "None", "None", "None",...
## $ NumHouseholds           <dbl> 54, 54, 29, 29, 29, 29, 29, 54, 25, 73, 46,...
## $ LandUse                 <chr> "Park", "Park", "Park", "Logging", "Park", ...
## $ Veg_Rich                <dbl> 16.67, 15.75, 16.88, 12.44, 17.13, 16.50, 1...
## $ Veg_Stems               <dbl> 31.20, 37.44, 32.33, 29.39, 36.00, 29.22, 3...
## $ Veg_liana               <dbl> 5.78, 13.25, 4.75, 9.78, 13.25, 12.88, 8.38...
## $ Veg_DBH                 <dbl> 49.57, 34.59, 42.82, 36.62, 41.52, 44.07, 5...
## $ Veg_Canopy              <dbl> 3.78, 3.75, 3.43, 3.75, 3.88, 2.50, 4.00, 4...
## $ Veg_Understory          <dbl> 2.89, 3.88, 3.00, 2.75, 3.25, 3.00, 2.38, 2...
## $ RA_Apes                 <dbl> 1.87, 0.00, 4.49, 12.93, 0.00, 2.48, 3.78, ...
## $ RA_Birds                <dbl> 52.66, 52.17, 37.44, 59.29, 52.62, 38.64, 4...
## $ RA_Elephant             <dbl> 0.00, 0.86, 1.33, 0.56, 1.00, 0.00, 1.11, 0...
## $ RA_Monkeys              <dbl> 38.59, 28.53, 41.82, 19.85, 41.34, 43.29, 4...
## $ RA_Rodent               <dbl> 4.22, 6.04, 1.06, 3.66, 2.52, 1.83, 3.10, 1...
## $ RA_Ungulate             <dbl> 2.66, 12.41, 13.86, 3.71, 2.53, 13.75, 3.10...
## $ Rich_AllSpecies         <dbl> 22, 20, 22, 19, 20, 22, 23, 19, 19, 19, 21,...
## $ Evenness_AllSpecies     <dbl> 0.793, 0.773, 0.740, 0.681, 0.811, 0.786, 0...
## $ Diversity_AllSpecies    <dbl> 2.452, 2.314, 2.288, 2.006, 2.431, 2.429, 2...
## $ Rich_BirdSpecies        <dbl> 11, 10, 11, 8, 8, 10, 11, 11, 11, 9, 11, 11...
## $ Evenness_BirdSpecies    <dbl> 0.732, 0.704, 0.688, 0.559, 0.799, 0.771, 0...
## $ Diversity_BirdSpecies   <dbl> 1.756, 1.620, 1.649, 1.162, 1.660, 1.775, 1...
## $ Rich_MammalSpecies      <dbl> 11, 10, 11, 11, 12, 12, 12, 8, 8, 10, 10, 1...
## $ Evenness_MammalSpecies  <dbl> 0.736, 0.705, 0.650, 0.619, 0.736, 0.694, 0...
## $ Diversity_MammalSpecies <dbl> 1.764, 1.624, 1.558, 1.484, 1.829, 1.725, 1...
```



```r
gabon<-janitor::clean_names(a_gabon)
gabon
```

```
## # A tibble: 24 x 26
##    transect_id distance hunt_cat num_households land_use veg_rich veg_stems
##          <dbl>    <dbl> <chr>             <dbl> <chr>       <dbl>     <dbl>
##  1           1     7.14 Moderate             54 Park         16.7      31.2
##  2           2    17.3  None                 54 Park         15.8      37.4
##  3           2    18.3  None                 29 Park         16.9      32.3
##  4           3    20.8  None                 29 Logging      12.4      29.4
##  5           4    16.0  None                 29 Park         17.1      36  
##  6           5    17.5  None                 29 Park         16.5      29.2
##  7           6    24.1  None                 29 Park         14.8      31.2
##  8           7    19.8  None                 54 Logging      13.2      32.6
##  9           8     5.78 High                 25 Neither      12.6      23.7
## 10           9     5.13 High                 73 Logging      16        27.1
## # ... with 14 more rows, and 19 more variables: veg_liana <dbl>, veg_dbh <dbl>,
## #   veg_canopy <dbl>, veg_understory <dbl>, ra_apes <dbl>, ra_birds <dbl>,
## #   ra_elephant <dbl>, ra_monkeys <dbl>, ra_rodent <dbl>, ra_ungulate <dbl>,
## #   rich_all_species <dbl>, evenness_all_species <dbl>,
## #   diversity_all_species <dbl>, rich_bird_species <dbl>,
## #   evenness_bird_species <dbl>, diversity_bird_species <dbl>,
## #   rich_mammal_species <dbl>, evenness_mammal_species <dbl>,
## #   diversity_mammal_species <dbl>
```


**10. (4 points) For the transects with high and moderate hunting intensity, how does the average diversity of birds and mammals compare?**



```r
gabon%>%
  filter(hunt_cat=="High" | hunt_cat=="Moderate")%>%
  group_by(hunt_cat)%>%
  summarize(avg_bird=mean(diversity_bird_species),
            avg_mammals=mean(diversity_mammal_species),
            n=n())
```

```
## `summarise()` ungrouping output (override with `.groups` argument)
```

```
## # A tibble: 2 x 4
##   hunt_cat avg_bird avg_mammals     n
##   <chr>       <dbl>       <dbl> <int>
## 1 High         1.66        1.74     7
## 2 Moderate     1.62        1.68     8
```


**11. (4 points) One of the conclusions in the study is that the relative abundance of animals drops off the closer you get to a village. Let's try to reconstruct this (without the statistics). How does the relative abundance (RA) of apes, birds, elephants, monkeys, rodents, and ungulates compare between sites that are less than 5km from a village to sites that are greater than 20km from a village? The variable `Distance` measures the distance of the transect from the nearest village. Hint: try using the `across` operator.**  


```r
gabon%>%
  filter(distance>=20 | distance<=5)%>%
  group_by("far"=distance>=20, "near"=distance<=5)%>%
  summarize(across(contains("ra_"),mean,na.rm=T),
            n=n())
```

```
## `summarise()` regrouping output by 'far' (override with `.groups` argument)
```

```
## # A tibble: 2 x 9
## # Groups:   far [2]
##   far   near  ra_apes ra_birds ra_elephant ra_monkeys ra_rodent ra_ungulate
##   <lgl> <lgl>   <dbl>    <dbl>       <dbl>      <dbl>     <dbl>       <dbl>
## 1 FALSE TRUE     0.08     70.4      0.0967       24.1      3.66        1.59
## 2 TRUE  FALSE    7.21     44.5      0.557        40.1      2.68        4.98
## # ... with 1 more variable: n <int>
```


**12. (4 points) Based on your interest, do one exploratory analysis on the `gabon` data of your choice. This analysis needs to include a minimum of two functions in `dplyr.`**


```r
gabon%>%
  filter(hunt_cat=="High" | hunt_cat=="Moderate")%>%
  group_by(farish=distance>=22, nearish=distance<=15)%>%
  summarize(rich_all_species, hunt_cat, num_households,
            n=n())%>%
  arrange(desc(rich_all_species))
```

```
## `summarise()` regrouping output by 'farish', 'nearish' (override with `.groups` argument)
```

```
## # A tibble: 15 x 6
## # Groups:   farish, nearish [2]
##    farish nearish rich_all_species hunt_cat num_households     n
##    <lgl>  <lgl>              <dbl> <chr>             <dbl> <int>
##  1 FALSE  TRUE                  22 Moderate             54    14
##  2 FALSE  TRUE                  22 Moderate             56    14
##  3 FALSE  TRUE                  22 Moderate             36    14
##  4 FALSE  TRUE                  22 High                 13    14
##  5 FALSE  TRUE                  21 Moderate             46    14
##  6 FALSE  TRUE                  21 Moderate             73    14
##  7 FALSE  FALSE                 20 Moderate             54     1
##  8 FALSE  TRUE                  20 High                 19    14
##  9 FALSE  TRUE                  19 High                 25    14
## 10 FALSE  TRUE                  19 High                 73    14
## 11 FALSE  TRUE                  19 High                 46    14
## 12 FALSE  TRUE                  19 High                 24    14
## 13 FALSE  TRUE                  19 High                 13    14
## 14 FALSE  TRUE                  16 Moderate             24    14
## 15 FALSE  TRUE                  15 Moderate             54    14
```


