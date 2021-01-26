---
title: "Lab_6_HW_AH"
author: "Aryss Hearne"
date: "1/25/2021"
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
library("skimr")
```

#### Load the data `FAO_1950to2012_111914.csv` as a new object titled `fisheries`.
#### 1. Do an exploratory analysis of the data (your choice). What are the names of the variables, what are the dimensions, are there any NA’s, what are the classes of the variables?


```r
fisheriess<-readr::read_csv("data/FAO_1950to2012_111914.csv")
```

```
## 
## -- Column specification --------------------------------------------------------
## cols(
##   .default = col_character(),
##   `ISSCAAP group#` = col_double(),
##   `FAO major fishing area` = col_double()
## )
## i Use `spec()` for the full column specifications.
```

```r
glimpse(fisheriess)
```

```
## Rows: 17,692
## Columns: 71
## $ Country                   <chr> "Albania", "Albania", "Albania", "Albania...
## $ `Common name`             <chr> "Angelsharks, sand devils nei", "Atlantic...
## $ `ISSCAAP group#`          <dbl> 38, 36, 37, 45, 32, 37, 33, 45, 38, 57, 3...
## $ `ISSCAAP taxonomic group` <chr> "Sharks, rays, chimaeras", "Tunas, bonito...
## $ `ASFIS species#`          <chr> "10903XXXXX", "1750100101", "17710001XX",...
## $ `ASFIS species name`      <chr> "Squatinidae", "Sarda sarda", "Sphyraena ...
## $ `FAO major fishing area`  <dbl> 37, 37, 37, 37, 37, 37, 37, 37, 37, 37, 3...
## $ Measure                   <chr> "Quantity (tonnes)", "Quantity (tonnes)",...
## $ `1950`                    <chr> NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, N...
## $ `1951`                    <chr> NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, N...
## $ `1952`                    <chr> NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, N...
## $ `1953`                    <chr> NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, N...
## $ `1954`                    <chr> NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, N...
## $ `1955`                    <chr> NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, N...
## $ `1956`                    <chr> NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, N...
## $ `1957`                    <chr> NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, N...
## $ `1958`                    <chr> NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, N...
## $ `1959`                    <chr> NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, N...
## $ `1960`                    <chr> NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, N...
## $ `1961`                    <chr> NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, N...
## $ `1962`                    <chr> NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, N...
## $ `1963`                    <chr> NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, N...
## $ `1964`                    <chr> NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, N...
## $ `1965`                    <chr> NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, N...
## $ `1966`                    <chr> NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, N...
## $ `1967`                    <chr> NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, N...
## $ `1968`                    <chr> NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, N...
## $ `1969`                    <chr> NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, N...
## $ `1970`                    <chr> NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, N...
## $ `1971`                    <chr> NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, N...
## $ `1972`                    <chr> NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, N...
## $ `1973`                    <chr> NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, N...
## $ `1974`                    <chr> NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, N...
## $ `1975`                    <chr> NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, N...
## $ `1976`                    <chr> NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, N...
## $ `1977`                    <chr> NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, N...
## $ `1978`                    <chr> NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, N...
## $ `1979`                    <chr> NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, N...
## $ `1980`                    <chr> NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, N...
## $ `1981`                    <chr> NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, N...
## $ `1982`                    <chr> NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, N...
## $ `1983`                    <chr> NA, NA, NA, NA, NA, NA, "559", NA, NA, NA...
## $ `1984`                    <chr> NA, NA, NA, NA, NA, NA, "392", NA, NA, NA...
## $ `1985`                    <chr> NA, NA, NA, NA, NA, NA, "406", NA, NA, NA...
## $ `1986`                    <chr> NA, NA, NA, NA, NA, NA, "499", NA, NA, NA...
## $ `1987`                    <chr> NA, NA, NA, NA, NA, NA, "564", NA, NA, NA...
## $ `1988`                    <chr> NA, NA, NA, NA, NA, NA, "724", NA, NA, NA...
## $ `1989`                    <chr> NA, NA, NA, NA, NA, NA, "583", NA, NA, NA...
## $ `1990`                    <chr> NA, NA, NA, NA, NA, NA, "754", NA, NA, NA...
## $ `1991`                    <chr> NA, NA, NA, NA, NA, NA, "283", NA, NA, NA...
## $ `1992`                    <chr> NA, NA, NA, NA, NA, NA, "196", NA, NA, NA...
## $ `1993`                    <chr> NA, NA, NA, NA, NA, NA, "150 F", NA, NA, ...
## $ `1994`                    <chr> NA, NA, NA, NA, NA, NA, "100 F", NA, NA, ...
## $ `1995`                    <chr> "0 0", "1", NA, "0 0", "0 0", NA, "52", "...
## $ `1996`                    <chr> "53", "2", NA, "3", "2", NA, "104", "8", ...
## $ `1997`                    <chr> "20", "0 0", NA, "0 0", "0 0", NA, "65", ...
## $ `1998`                    <chr> "31", "12", NA, NA, NA, NA, "220", "18", ...
## $ `1999`                    <chr> "30", "30", NA, NA, NA, NA, "220", "18", ...
## $ `2000`                    <chr> "30", "25", "2", NA, NA, NA, "220", "20",...
## $ `2001`                    <chr> "16", "30", NA, NA, NA, NA, "120", "23", ...
## $ `2002`                    <chr> "79", "24", NA, "34", "6", NA, "150", "84...
## $ `2003`                    <chr> "1", "4", NA, "22", NA, NA, "84", "178", ...
## $ `2004`                    <chr> "4", "2", "2", "15", "1", "2", "76", "285...
## $ `2005`                    <chr> "68", "23", "4", "12", "5", "6", "68", "1...
## $ `2006`                    <chr> "55", "30", "7", "18", "8", "9", "86", "1...
## $ `2007`                    <chr> "12", "19", NA, NA, NA, NA, "132", "18", ...
## $ `2008`                    <chr> "23", "27", NA, NA, NA, NA, "132", "23", ...
## $ `2009`                    <chr> "14", "21", NA, NA, NA, NA, "154", "20", ...
## $ `2010`                    <chr> "78", "23", "7", NA, NA, NA, "80", "228",...
## $ `2011`                    <chr> "12", "12", NA, NA, NA, NA, "88", "9", NA...
## $ `2012`                    <chr> "5", "5", NA, NA, NA, NA, "129", "290", N...
```

#### 2. Use janitor to rename the columns and make them easier to use. As part of this cleaning step, change country, isscaap_group_number, asfis_species_number, and fao_major_fishing_area to data class factor.


```r
fisheries<-janitor::clean_names(fisheriess)
fisheries
```

```
## # A tibble: 17,692 x 71
##    country common_name isscaap_group_n~ isscaap_taxonom~ asfis_species_n~
##    <chr>   <chr>                  <dbl> <chr>            <chr>           
##  1 Albania Angelshark~               38 Sharks, rays, c~ 10903XXXXX      
##  2 Albania Atlantic b~               36 Tunas, bonitos,~ 1750100101      
##  3 Albania Barracudas~               37 Miscellaneous p~ 17710001XX      
##  4 Albania Blue and r~               45 Shrimps, prawns  2280203101      
##  5 Albania Blue whiti~               32 Cods, hakes, ha~ 1480403301      
##  6 Albania Bluefish                  37 Miscellaneous p~ 1702021301      
##  7 Albania Bogue                     33 Miscellaneous c~ 1703926101      
##  8 Albania Caramote p~               45 Shrimps, prawns  2280100117      
##  9 Albania Catsharks,~               38 Sharks, rays, c~ 10801003XX      
## 10 Albania Common cut~               57 Squids, cuttlef~ 3210200202      
## # ... with 17,682 more rows, and 66 more variables: asfis_species_name <chr>,
## #   fao_major_fishing_area <dbl>, measure <chr>, x1950 <chr>, x1951 <chr>,
## #   x1952 <chr>, x1953 <chr>, x1954 <chr>, x1955 <chr>, x1956 <chr>,
## #   x1957 <chr>, x1958 <chr>, x1959 <chr>, x1960 <chr>, x1961 <chr>,
## #   x1962 <chr>, x1963 <chr>, x1964 <chr>, x1965 <chr>, x1966 <chr>,
## #   x1967 <chr>, x1968 <chr>, x1969 <chr>, x1970 <chr>, x1971 <chr>,
## #   x1972 <chr>, x1973 <chr>, x1974 <chr>, x1975 <chr>, x1976 <chr>,
## #   x1977 <chr>, x1978 <chr>, x1979 <chr>, x1980 <chr>, x1981 <chr>,
## #   x1982 <chr>, x1983 <chr>, x1984 <chr>, x1985 <chr>, x1986 <chr>,
## #   x1987 <chr>, x1988 <chr>, x1989 <chr>, x1990 <chr>, x1991 <chr>,
## #   x1992 <chr>, x1993 <chr>, x1994 <chr>, x1995 <chr>, x1996 <chr>,
## #   x1997 <chr>, x1998 <chr>, x1999 <chr>, x2000 <chr>, x2001 <chr>,
## #   x2002 <chr>, x2003 <chr>, x2004 <chr>, x2005 <chr>, x2006 <chr>,
## #   x2007 <chr>, x2008 <chr>, x2009 <chr>, x2010 <chr>, x2011 <chr>,
## #   x2012 <chr>
```


```r
fisheries$country<-as.factor(fisheries$country)
fisheries$isscaap_group_number<-as.factor(fisheries$isscaap_group_number)
fisheries$asfis_species_number<-as.factor(fisheries$asfis_species_number)
fisheries$fao_major_fishing_area<-as.factor(fisheries$fao_major_fishing_area)
fisheries
```

```
## # A tibble: 17,692 x 71
##    country common_name isscaap_group_n~ isscaap_taxonom~ asfis_species_n~
##    <fct>   <chr>       <fct>            <chr>            <fct>           
##  1 Albania Angelshark~ 38               Sharks, rays, c~ 10903XXXXX      
##  2 Albania Atlantic b~ 36               Tunas, bonitos,~ 1750100101      
##  3 Albania Barracudas~ 37               Miscellaneous p~ 17710001XX      
##  4 Albania Blue and r~ 45               Shrimps, prawns  2280203101      
##  5 Albania Blue whiti~ 32               Cods, hakes, ha~ 1480403301      
##  6 Albania Bluefish    37               Miscellaneous p~ 1702021301      
##  7 Albania Bogue       33               Miscellaneous c~ 1703926101      
##  8 Albania Caramote p~ 45               Shrimps, prawns  2280100117      
##  9 Albania Catsharks,~ 38               Sharks, rays, c~ 10801003XX      
## 10 Albania Common cut~ 57               Squids, cuttlef~ 3210200202      
## # ... with 17,682 more rows, and 66 more variables: asfis_species_name <chr>,
## #   fao_major_fishing_area <fct>, measure <chr>, x1950 <chr>, x1951 <chr>,
## #   x1952 <chr>, x1953 <chr>, x1954 <chr>, x1955 <chr>, x1956 <chr>,
## #   x1957 <chr>, x1958 <chr>, x1959 <chr>, x1960 <chr>, x1961 <chr>,
## #   x1962 <chr>, x1963 <chr>, x1964 <chr>, x1965 <chr>, x1966 <chr>,
## #   x1967 <chr>, x1968 <chr>, x1969 <chr>, x1970 <chr>, x1971 <chr>,
## #   x1972 <chr>, x1973 <chr>, x1974 <chr>, x1975 <chr>, x1976 <chr>,
## #   x1977 <chr>, x1978 <chr>, x1979 <chr>, x1980 <chr>, x1981 <chr>,
## #   x1982 <chr>, x1983 <chr>, x1984 <chr>, x1985 <chr>, x1986 <chr>,
## #   x1987 <chr>, x1988 <chr>, x1989 <chr>, x1990 <chr>, x1991 <chr>,
## #   x1992 <chr>, x1993 <chr>, x1994 <chr>, x1995 <chr>, x1996 <chr>,
## #   x1997 <chr>, x1998 <chr>, x1999 <chr>, x2000 <chr>, x2001 <chr>,
## #   x2002 <chr>, x2003 <chr>, x2004 <chr>, x2005 <chr>, x2006 <chr>,
## #   x2007 <chr>, x2008 <chr>, x2009 <chr>, x2010 <chr>, x2011 <chr>,
## #   x2012 <chr>
```

#### We need to deal with the years because they are being treated as characters and start with an X. We also have the problem that the column names that are years actually represent data. We haven’t discussed tidy data yet, so here is some help. You should run this ugly chunk to transform the data for the rest of the homework. It will only work if you have used janitor to rename the variables in question 2!


```r
fisheries_tidy <- fisheries %>% 
  pivot_longer(-c(country,common_name,isscaap_group_number,isscaap_taxonomic_group,asfis_species_number,asfis_species_name,fao_major_fishing_area,measure),
               names_to = "year",
               values_to = "catch",
               values_drop_na = TRUE) %>% 
  mutate(year= as.numeric(str_replace(year, 'x', ''))) %>% 
  mutate(catch= str_replace(catch, c(' F'), replacement = '')) %>% 
  mutate(catch= str_replace(catch, c('...'), replacement = '')) %>% 
  mutate(catch= str_replace(catch, c('-'), replacement = '')) %>% 
  mutate(catch= str_replace(catch, c('0 0'), replacement = ''))

fisheries_tidy$catch <- as.numeric(fisheries_tidy$catch)
```


#### 3. How many countries are represented in the data? Provide a count and list their names.


```r
fisheries%>%
  group_by(country)%>%
  count(country, sort=F)
```

```
## # A tibble: 204 x 2
## # Groups:   country [204]
##    country                 n
##    <fct>               <int>
##  1 Albania                67
##  2 Algeria                59
##  3 American Samoa         32
##  4 Angola                 88
##  5 Anguilla                3
##  6 Antigua and Barbuda    22
##  7 Argentina             140
##  8 Aruba                   5
##  9 Australia             301
## 10 Bahamas                14
## # ... with 194 more rows
```

#### 4. Refocus the data only to include only: `country`, `isscaap_taxonomic_group`, `asfis_species_name`, `asfis_species_number`, `year`, `catch`.


```r
fisheries%>%
  select(country, isscaap_taxonomic_group, asfis_species_name, asfis_species_number)
```

```
## # A tibble: 17,692 x 4
##    country isscaap_taxonomic_group     asfis_species_name     asfis_species_num~
##    <fct>   <chr>                       <chr>                  <fct>             
##  1 Albania Sharks, rays, chimaeras     Squatinidae            10903XXXXX        
##  2 Albania Tunas, bonitos, billfishes  Sarda sarda            1750100101        
##  3 Albania Miscellaneous pelagic fish~ Sphyraena spp          17710001XX        
##  4 Albania Shrimps, prawns             Aristeus antennatus    2280203101        
##  5 Albania Cods, hakes, haddocks       Micromesistius poutas~ 1480403301        
##  6 Albania Miscellaneous pelagic fish~ Pomatomus saltatrix    1702021301        
##  7 Albania Miscellaneous coastal fish~ Boops boops            1703926101        
##  8 Albania Shrimps, prawns             Penaeus kerathurus     2280100117        
##  9 Albania Sharks, rays, chimaeras     Scyliorhinus spp       10801003XX        
## 10 Albania Squids, cuttlefishes, octo~ Sepia officinalis      3210200202        
## # ... with 17,682 more rows
```

#### 5. Based on the `asfis_species_number`, how many distinct fish species were caught as part of these data?


```r
fisheries%>%
  summarize(distinct_species=n_distinct(asfis_species_number))
```

```
## # A tibble: 1 x 1
##   distinct_species
##              <int>
## 1             1553
```

#### 6. Which country had the largest overall catch in the year 2000?


```r
fisheries%>%
  group_by(country)%>%
  select(country, x2000)%>%
  arrange(desc(x2000))
```

```
## # A tibble: 17,692 x 2
## # Groups:   country [204]
##    country            x2000
##    <fct>              <chr>
##  1 Ukraine            9998 
##  2 Thailand           9992 
##  3 Angola             999  
##  4 Russian Federation 998  
##  5 France             9968 
##  6 Pakistan           9961 
##  7 Ecuador            9930 
##  8 Australia          993  
##  9 United Kingdom     990  
## 10 Uruguay            990  
## # ... with 17,682 more rows
```

#### 7. Which country caught the most sardines (Sardina pilchardus) between the years 1990-2000?


```r
fisheries_tidy%>% 
  select(country, year, isscaap_taxonomic_group)%>%
  filter(year >= 1990, year <= 2000) %>% 
  count(sum(isscaap_taxonomic_group=="Sardina pilchardus"), sort=T)
```

```
## # A tibble: 1 x 2
##   `sum(isscaap_taxonomic_group == "Sardina pilchardus")`     n
##                                                    <int> <int>
## 1                                                      0 84944
```

#### 8. Which five countries caught the most cephalopods between 2008-2012?


```r
fisheries%>% 
  filter(isscaap_taxonomic_group=="Squids, cuttlefishes, octopuses") %>% 
  count(asfis_species_name, sort=T)
```

```
## # A tibble: 35 x 2
##    asfis_species_name              n
##    <chr>                       <int>
##  1 Loliginidae, Ommastrephidae   182
##  2 Octopodidae                   147
##  3 Sepiidae, Sepiolidae          117
##  4 Loligo spp                     47
##  5 Illex argentinus               31
##  6 Illex illecebrosus             28
##  7 Cephalopoda                    23
##  8 Loligo gahi                    21
##  9 Octopus vulgaris               21
## 10 Sepia officinalis              21
## # ... with 25 more rows
```

#### 9. Which species had the highest catch total between 2008-2012? (hint: Osteichthyes is not a species)


```r
fisheries_tidy %>% 
  filter(year >= 2008, year <= 2012) %>% 
  select(country, isscaap_taxonomic_group, asfis_species_name, year, catch) %>% 
  group_by(country, asfis_species_name)
```

```
## # A tibble: 51,014 x 5
## # Groups:   country, asfis_species_name [9,238]
##    country isscaap_taxonomic_group    asfis_species_name  year catch
##    <fct>   <chr>                      <chr>              <dbl> <dbl>
##  1 Albania Sharks, rays, chimaeras    Squatinidae         2008    23
##  2 Albania Sharks, rays, chimaeras    Squatinidae         2009    14
##  3 Albania Sharks, rays, chimaeras    Squatinidae         2010    78
##  4 Albania Sharks, rays, chimaeras    Squatinidae         2011    12
##  5 Albania Sharks, rays, chimaeras    Squatinidae         2012     5
##  6 Albania Tunas, bonitos, billfishes Sarda sarda         2008    27
##  7 Albania Tunas, bonitos, billfishes Sarda sarda         2009    21
##  8 Albania Tunas, bonitos, billfishes Sarda sarda         2010    23
##  9 Albania Tunas, bonitos, billfishes Sarda sarda         2011    12
## 10 Albania Tunas, bonitos, billfishes Sarda sarda         2012     5
## # ... with 51,004 more rows
```

#### 10. Use the data to do at least one analysis of your choice.


```r
fisheries%>%
  summarize(species=n_distinct(asfis_species_name))
```

```
## # A tibble: 1 x 1
##   species
##     <int>
## 1    1548
```

