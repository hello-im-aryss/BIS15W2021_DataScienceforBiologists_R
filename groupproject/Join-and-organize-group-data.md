---
title: "group project excel join"
author: "Aryss Hearne"
date: "2/26/2021"
output: 
  html_document: 
    keep_md: yes
---




```r
library(tidyverse)
```

```
## -- Attaching packages --------------------------------------- tidyverse 1.3.0 --
```

```
## v ggplot2 3.3.3     v purrr   0.3.4
## v tibble  3.1.0     v dplyr   1.0.4
## v tidyr   1.1.2     v stringr 1.4.0
## v readr   1.4.0     v forcats 0.5.1
```

```
## -- Conflicts ------------------------------------------ tidyverse_conflicts() --
## x dplyr::filter() masks stats::filter()
## x dplyr::lag()    masks stats::lag()
```

```r
library(here)
```

```
## here() starts at C:/Users/starf/Documents/GitHub/BIS15W2021_ahearne
```

```r
library(janitor)
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
eukaryotes<-readr::read_csv("data/eukaryotes.csv")
```

```
## 
## -- Column specification --------------------------------------------------------
## cols(
##   `Organism Name` = col_character(),
##   `Organism Groups` = col_character(),
##   Strain = col_character(),
##   BioSample = col_character(),
##   BioProject = col_character(),
##   Assembly = col_character(),
##   Level = col_character(),
##   `Size(Mb)` = col_double(),
##   `GC%` = col_double(),
##   Replicons = col_character(),
##   WGS = col_character(),
##   Scaffolds = col_double(),
##   CDS = col_double(),
##   `Release Date` = col_datetime(format = ""),
##   `GenBank FTP` = col_character(),
##   `RefSeq FTP` = col_character(),
##   Genes = col_double()
## )
```

```
## Warning: 2 parsing failures.
##  row    col           expected actual                  file
## 3666 Strain delimiter or quote      D 'data/eukaryotes.csv'
## 3666 Strain delimiter or quote        'data/eukaryotes.csv'
```

```r
prokaryotes<-readr::read_csv("data/prokaryotes.csv")
```

```
## 
## -- Column specification --------------------------------------------------------
## cols(
##   `Organism Name` = col_character(),
##   `Organism Groups` = col_character(),
##   Strain = col_character(),
##   BioSample = col_character(),
##   BioProject = col_character(),
##   Assembly = col_character(),
##   Level = col_character(),
##   `Size(Mb)` = col_double(),
##   `GC%` = col_double(),
##   Replicons = col_character(),
##   WGS = col_character(),
##   Scaffolds = col_double(),
##   CDS = col_double(),
##   `Release Date` = col_datetime(format = ""),
##   `GenBank FTP` = col_character(),
##   `RefSeq FTP` = col_character(),
##   Genes = col_double()
## )
```


```r
#names(eukaryotes)
#names(prokaryotes)
```



```r
organism_data<-full_join(eukaryotes,prokaryotes)
```

```
## Joining, by = c("Organism Name", "Organism Groups", "Strain", "BioSample", "BioProject", "Assembly", "Level", "Size(Mb)", "GC%", "Replicons", "WGS", "Scaffolds", "CDS", "Release Date", "GenBank FTP", "RefSeq FTP", "Genes")
```

```r
organism_data
```

```
## # A tibble: 260,517 x 17
##    `Organism Name`  `Organism Groups` Strain BioSample BioProject Assembly Level
##    <chr>            <chr>             <chr>  <chr>     <chr>      <chr>    <chr>
##  1 Pyropia yezoens~ Eukaryota;Other;~ <NA>   SAMN1331~ PRJNA5899~ GCA_009~ Chro~
##  2 Emiliania huxle~ Eukaryota;Protis~ CCMP1~ SAMN0274~ PRJNA77753 GCA_000~ Scaf~
##  3 Arabidopsis tha~ Eukaryota;Plants~ <NA>   SAMN0308~ PRJNA10719 GCA_000~ Chro~
##  4 Glycine max      Eukaryota;Plants~ <NA>   SAMN0000~ PRJNA19861 GCA_000~ Chro~
##  5 Medicago trunca~ Eukaryota;Plants~ A17    SAMN0229~ PRJNA10791 GCA_000~ Chro~
##  6 Solanum lycoper~ Eukaryota;Plants~ <NA>   SAMN0298~ PRJNA119   GCA_000~ Chro~
##  7 Oryza sativa Ja~ Eukaryota;Plants~ <NA>   SAMD0000~ PRJNA12269 GCA_001~ Chro~
##  8 Triticum aestiv~ Eukaryota;Plants~ <NA>   SAMEA479~ PRJEB27788 GCA_900~ Chro~
##  9 Zea mays         Eukaryota;Plants~ <NA>   SAMN0429~ PRJNA10769 GCA_000~ Chro~
## 10 Pneumocystis ca~ Eukaryota;Fungi;~ B80    SAMN0238~ PRJNA2235~ GCA_001~ Cont~
## # ... with 260,507 more rows, and 10 more variables: Size(Mb) <dbl>, GC% <dbl>,
## #   Replicons <chr>, WGS <chr>, Scaffolds <dbl>, CDS <dbl>,
## #   Release Date <dttm>, GenBank FTP <chr>, RefSeq FTP <chr>, Genes <dbl>
```


```r
organism_data2<-
  organism_data%>%
  separate(`Organism Name`, into = c("genus", "species"),sep=" ")%>%
  separate(`Organism Groups`, into = c("domain","kingdom","subgroup"),sep=";")
```

```
## Warning: Expected 2 pieces. Additional pieces discarded in 97894 rows [2, 7, 10,
## 12, 13, 14, 15, 17, 18, 19, 22, 24, 25, 27, 28, 34, 40, 47, 48, 49, ...].
```

```
## Warning: Expected 2 pieces. Missing pieces filled with `NA` in 635 rows [29489,
## 32062, 40948, 41040, 49442, 49505, 50858, 50920, 55482, 55539, 56416, 56470,
## 59846, 59898, 60571, 60624, 63381, 63427, 63992, 64032, ...].
```

```r
organism_data2
```

```
## # A tibble: 260,517 x 20
##    genus  species  domain  kingdom subgroup Strain BioSample BioProject Assembly
##    <chr>  <chr>    <chr>   <chr>   <chr>    <chr>  <chr>     <chr>      <chr>   
##  1 Pyrop~ yezoens~ Eukary~ Other   Other    <NA>   SAMN1331~ PRJNA5899~ GCA_009~
##  2 Emili~ huxleyi  Eukary~ Protis~ Other P~ CCMP1~ SAMN0274~ PRJNA77753 GCA_000~
##  3 Arabi~ thaliana Eukary~ Plants  Land Pl~ <NA>   SAMN0308~ PRJNA10719 GCA_000~
##  4 Glyci~ max      Eukary~ Plants  Land Pl~ <NA>   SAMN0000~ PRJNA19861 GCA_000~
##  5 Medic~ truncat~ Eukary~ Plants  Land Pl~ A17    SAMN0229~ PRJNA10791 GCA_000~
##  6 Solan~ lycoper~ Eukary~ Plants  Land Pl~ <NA>   SAMN0298~ PRJNA119   GCA_000~
##  7 Oryza  sativa   Eukary~ Plants  Land Pl~ <NA>   SAMD0000~ PRJNA12269 GCA_001~
##  8 Triti~ aestivum Eukary~ Plants  Land Pl~ <NA>   SAMEA479~ PRJEB27788 GCA_900~
##  9 Zea    mays     Eukary~ Plants  Land Pl~ <NA>   SAMN0429~ PRJNA10769 GCA_000~
## 10 Pneum~ carinii  Eukary~ Fungi   Ascomyc~ B80    SAMN0238~ PRJNA2235~ GCA_001~
## # ... with 260,507 more rows, and 11 more variables: Level <chr>,
## #   Size(Mb) <dbl>, GC% <dbl>, Replicons <chr>, WGS <chr>, Scaffolds <dbl>,
## #   CDS <dbl>, Release Date <dttm>, GenBank FTP <chr>, RefSeq FTP <chr>,
## #   Genes <dbl>
```


```r
organism_data3<-organism_data2%>%
  select(domain, kingdom, subgroup, genus, species,`Size(Mb)`, 'GC%', CDS, Genes)%>%
  rename(size_mb='Size(Mb)', perc_gc="GC%", protein_coding_genes="CDS", genes="Genes")
organism_data3
```

```
## # A tibble: 260,517 x 9
##    domain  kingdom subgroup genus species size_mb perc_gc protein_coding_~ genes
##    <chr>   <chr>   <chr>    <chr> <chr>     <dbl>   <dbl>            <dbl> <dbl>
##  1 Eukary~ Other   Other    Pyro~ yezoen~  1.08e2    64.8                0     0
##  2 Eukary~ Protis~ Other P~ Emil~ huxleyi  1.68e2    64.5            38554 38549
##  3 Eukary~ Plants  Land Pl~ Arab~ thalia~  1.20e2    36.1            48265 38311
##  4 Eukary~ Plants  Land Pl~ Glyc~ max      9.79e2    35.1            71219 59847
##  5 Eukary~ Plants  Land Pl~ Medi~ trunca~  4.13e2    34.0            41939 37603
##  6 Eukary~ Plants  Land Pl~ Sola~ lycope~  8.28e2    35.7            37660 31200
##  7 Eukary~ Plants  Land Pl~ Oryza sativa   3.74e2    43.6            42578 35219
##  8 Eukary~ Plants  Land Pl~ Trit~ aestiv~  1.45e4    46.1                0     0
##  9 Eukary~ Plants  Land Pl~ Zea   mays     2.14e3    46.9            58411 49296
## 10 Eukary~ Fungi   Ascomyc~ Pneu~ carinii  7.66e0    27.8             3646  3695
## # ... with 260,507 more rows
```


```r
#organism_data3%>%
  #filter(kingdom=="Proteobacteria") #just making sure the prokaryotes made it in
```

