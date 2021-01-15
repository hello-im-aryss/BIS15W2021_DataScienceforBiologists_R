---
title: "HW4_AH"
author: "Aryss Hearne"
date: "1/14/2021"
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
## v tibble  3.0.4     v dplyr   1.0.2
## v tidyr   1.1.2     v stringr 1.4.0
## v readr   1.4.0     v forcats 0.5.0
```

```
## -- Conflicts ------------------------------------------ tidyverse_conflicts() --
## x dplyr::filter() masks stats::filter()
## x dplyr::lag()    masks stats::lag()
```
#### 1. Load the data into a new object called `homerange`.


```r
homerange <- readr::read_csv("data/Tamburelloetal_HomeRangeDatabase.csv")
```

```
## 
## -- Column specification --------------------------------------------------------
## cols(
##   .default = col_character(),
##   mean.mass.g = col_double(),
##   log10.mass = col_double(),
##   mean.hra.m2 = col_double(),
##   log10.hra = col_double(),
##   preymass = col_double(),
##   log10.preymass = col_double(),
##   PPMR = col_double()
## )
## i Use `spec()` for the full column specifications.
```
#### 2. Explore the data. Show the dimensions, column names, classes for each variable, and a statistical summary. Keep these as separate code chunks.


```r
glimpse(homerange)
```

```
## Rows: 569
## Columns: 24
## $ taxon                      <chr> "lake fishes", "river fishes", "river fi...
## $ common.name                <chr> "american eel", "blacktail redhorse", "c...
## $ class                      <chr> "actinopterygii", "actinopterygii", "act...
## $ order                      <chr> "anguilliformes", "cypriniformes", "cypr...
## $ family                     <chr> "anguillidae", "catostomidae", "cyprinid...
## $ genus                      <chr> "anguilla", "moxostoma", "campostoma", "...
## $ species                    <chr> "rostrata", "poecilura", "anomalum", "fu...
## $ primarymethod              <chr> "telemetry", "mark-recapture", "mark-rec...
## $ N                          <chr> "16", NA, "20", "26", "17", "5", "2", "2...
## $ mean.mass.g                <dbl> 887.00, 562.00, 34.00, 4.00, 4.00, 3525....
## $ log10.mass                 <dbl> 2.9479236, 2.7497363, 1.5314789, 0.60206...
## $ alternative.mass.reference <chr> NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, ...
## $ mean.hra.m2                <dbl> 282750.00, 282.10, 116.11, 125.50, 87.10...
## $ log10.hra                  <dbl> 5.4514026, 2.4504031, 2.0648696, 2.09864...
## $ hra.reference              <chr> "Minns, C. K. 1995. Allometry of home ra...
## $ realm                      <chr> "aquatic", "aquatic", "aquatic", "aquati...
## $ thermoregulation           <chr> "ectotherm", "ectotherm", "ectotherm", "...
## $ locomotion                 <chr> "swimming", "swimming", "swimming", "swi...
## $ trophic.guild              <chr> "carnivore", "carnivore", "carnivore", "...
## $ dimension                  <chr> "3D", "2D", "2D", "2D", "2D", "2D", "2D"...
## $ preymass                   <dbl> NA, NA, NA, NA, NA, NA, 1.39, NA, NA, NA...
## $ log10.preymass             <dbl> NA, NA, NA, NA, NA, NA, 0.1430148, NA, N...
## $ PPMR                       <dbl> NA, NA, NA, NA, NA, NA, 530, NA, NA, NA,...
## $ prey.size.reference        <chr> NA, NA, NA, NA, NA, NA, "Brose U, et al....
```

```r
dim(homerange)
```

```
## [1] 569  24
```

```r
names(homerange)
```

```
##  [1] "taxon"                      "common.name"               
##  [3] "class"                      "order"                     
##  [5] "family"                     "genus"                     
##  [7] "species"                    "primarymethod"             
##  [9] "N"                          "mean.mass.g"               
## [11] "log10.mass"                 "alternative.mass.reference"
## [13] "mean.hra.m2"                "log10.hra"                 
## [15] "hra.reference"              "realm"                     
## [17] "thermoregulation"           "locomotion"                
## [19] "trophic.guild"              "dimension"                 
## [21] "preymass"                   "log10.preymass"            
## [23] "PPMR"                       "prey.size.reference"
```

```r
homerange2<-rename(homerange, taxon=taxon, common_name=common.name, class=class, order=order, family=family, genus=genus, species=species, primary_method=primarymethod, n=N, mean_mass_g=mean.mass.g, log10_mass=log10.mass, alternative_mass_reference=alternative.mass.reference, mean_hra_m2=mean.hra.m2, log10_hra=log10.hra, hra_reference=hra.reference, realm=realm, thermoregulation=thermoregulation, locomtion=locomotion, trophic_guild=trophic.guild, dimension=dimension, preymass=preymass, log10_preymass=log10.preymass, ppmr=PPMR, prey_size_reference=prey.size.reference)
names(homerange2)
```

```
##  [1] "taxon"                      "common_name"               
##  [3] "class"                      "order"                     
##  [5] "family"                     "genus"                     
##  [7] "species"                    "primary_method"            
##  [9] "n"                          "mean_mass_g"               
## [11] "log10_mass"                 "alternative_mass_reference"
## [13] "mean_hra_m2"                "log10_hra"                 
## [15] "hra_reference"              "realm"                     
## [17] "thermoregulation"           "locomtion"                 
## [19] "trophic_guild"              "dimension"                 
## [21] "preymass"                   "log10_preymass"            
## [23] "ppmr"                       "prey_size_reference"
```




```r
str(homerange2)
```

```
## tibble [569 x 24] (S3: spec_tbl_df/tbl_df/tbl/data.frame)
##  $ taxon                     : chr [1:569] "lake fishes" "river fishes" "river fishes" "river fishes" ...
##  $ common_name               : chr [1:569] "american eel" "blacktail redhorse" "central stoneroller" "rosyside dace" ...
##  $ class                     : chr [1:569] "actinopterygii" "actinopterygii" "actinopterygii" "actinopterygii" ...
##  $ order                     : chr [1:569] "anguilliformes" "cypriniformes" "cypriniformes" "cypriniformes" ...
##  $ family                    : chr [1:569] "anguillidae" "catostomidae" "cyprinidae" "cyprinidae" ...
##  $ genus                     : chr [1:569] "anguilla" "moxostoma" "campostoma" "clinostomus" ...
##  $ species                   : chr [1:569] "rostrata" "poecilura" "anomalum" "funduloides" ...
##  $ primary_method            : chr [1:569] "telemetry" "mark-recapture" "mark-recapture" "mark-recapture" ...
##  $ n                         : chr [1:569] "16" NA "20" "26" ...
##  $ mean_mass_g               : num [1:569] 887 562 34 4 4 ...
##  $ log10_mass                : num [1:569] 2.948 2.75 1.531 0.602 0.602 ...
##  $ alternative_mass_reference: chr [1:569] NA NA NA NA ...
##  $ mean_hra_m2               : num [1:569] 282750 282.1 116.1 125.5 87.1 ...
##  $ log10_hra                 : num [1:569] 5.45 2.45 2.06 2.1 1.94 ...
##  $ hra_reference             : chr [1:569] "Minns, C. K. 1995. Allometry of home range size in lake and river fishes. Canadian Journal of Fisheries and Aqu"| __truncated__ "Minns, C. K. 1995. Allometry of home range size in lake and river fishes. Canadian Journal of Fisheries and Aqu"| __truncated__ "Minns, C. K. 1995. Allometry of home range size in lake and river fishes. Canadian Journal of Fisheries and Aqu"| __truncated__ "Minns, C. K. 1995. Allometry of home range size in lake and river fishes. Canadian Journal of Fisheries and Aqu"| __truncated__ ...
##  $ realm                     : chr [1:569] "aquatic" "aquatic" "aquatic" "aquatic" ...
##  $ thermoregulation          : chr [1:569] "ectotherm" "ectotherm" "ectotherm" "ectotherm" ...
##  $ locomtion                 : chr [1:569] "swimming" "swimming" "swimming" "swimming" ...
##  $ trophic_guild             : chr [1:569] "carnivore" "carnivore" "carnivore" "carnivore" ...
##  $ dimension                 : chr [1:569] "3D" "2D" "2D" "2D" ...
##  $ preymass                  : num [1:569] NA NA NA NA NA NA 1.39 NA NA NA ...
##  $ log10_preymass            : num [1:569] NA NA NA NA NA ...
##  $ ppmr                      : num [1:569] NA NA NA NA NA NA 530 NA NA NA ...
##  $ prey_size_reference       : chr [1:569] NA NA NA NA ...
##  - attr(*, "spec")=
##   .. cols(
##   ..   taxon = col_character(),
##   ..   common.name = col_character(),
##   ..   class = col_character(),
##   ..   order = col_character(),
##   ..   family = col_character(),
##   ..   genus = col_character(),
##   ..   species = col_character(),
##   ..   primarymethod = col_character(),
##   ..   N = col_character(),
##   ..   mean.mass.g = col_double(),
##   ..   log10.mass = col_double(),
##   ..   alternative.mass.reference = col_character(),
##   ..   mean.hra.m2 = col_double(),
##   ..   log10.hra = col_double(),
##   ..   hra.reference = col_character(),
##   ..   realm = col_character(),
##   ..   thermoregulation = col_character(),
##   ..   locomotion = col_character(),
##   ..   trophic.guild = col_character(),
##   ..   dimension = col_character(),
##   ..   preymass = col_double(),
##   ..   log10.preymass = col_double(),
##   ..   PPMR = col_double(),
##   ..   prey.size.reference = col_character()
##   .. )
```

#### 3. Change the class of the variables `taxon` and `order` to factors and display their levels.


```r
homerange2$taxon<-as.factor(homerange2$taxon)
homerange2$order<-as.factor(homerange2$order)
```

#### 4. What taxa are represented in the `homerange` data frame? Make a new data frame taxa that is restricted to taxon, common name, class, order, family, genus, species.


```r
levels(homerange2$taxon)
```

```
## [1] "birds"         "lake fishes"   "lizards"       "mammals"      
## [5] "marine fishes" "river fishes"  "snakes"        "tortoises"    
## [9] "turtles"
```

```r
taxa<-select(homerange2, taxon, common_name, class, order, family, genus, species)
taxa
```

```
## # A tibble: 569 x 7
##    taxon     common_name       class      order     family    genus    species  
##    <fct>     <chr>             <chr>      <fct>     <chr>     <chr>    <chr>    
##  1 lake fis~ american eel      actinopte~ anguilli~ anguilli~ anguilla rostrata 
##  2 river fi~ blacktail redhor~ actinopte~ cyprinif~ catostom~ moxosto~ poecilura
##  3 river fi~ central stonerol~ actinopte~ cyprinif~ cyprinid~ campost~ anomalum 
##  4 river fi~ rosyside dace     actinopte~ cyprinif~ cyprinid~ clinost~ funduloi~
##  5 river fi~ longnose dace     actinopte~ cyprinif~ cyprinid~ rhinich~ cataract~
##  6 river fi~ muskellunge       actinopte~ esocifor~ esocidae  esox     masquino~
##  7 marine f~ pollack           actinopte~ gadiform~ gadidae   pollach~ pollachi~
##  8 marine f~ saithe            actinopte~ gadiform~ gadidae   pollach~ virens   
##  9 marine f~ lined surgeonfish actinopte~ percifor~ acanthur~ acanthu~ lineatus 
## 10 marine f~ orangespine unic~ actinopte~ percifor~ acanthur~ naso     lituratus
## # ... with 559 more rows
```

#### 5. The variable `taxon` identifies the large, common name groups of the species represented in homerange. Make a table the shows the counts for each of these `taxon`.


```r
#birds
#taxon 1/9
tweet<-grepl("birds", taxa$taxon)
tweeter<-filter(taxa, taxon=="birds")
tweeter$taxa_recorded <- c(sum(tweet))
tweeter
```

```
## # A tibble: 140 x 8
##    taxon common_name     class order     family    genus  species  taxa_recorded
##    <fct> <chr>           <chr> <fct>     <chr>     <chr>  <chr>            <int>
##  1 birds golden eagle    aves  accipitr~ accipitr~ aquila chrysae~           140
##  2 birds common buzzard  aves  accipitr~ accipitr~ buteo  buteo              140
##  3 birds short-toed sna~ aves  accipitr~ accipitr~ circa~ gallicus           140
##  4 birds Bonelli's eagle aves  accipitr~ accipitr~ hiera~ fasciat~           140
##  5 birds booted eagle    aves  accipitr~ accipitr~ hiera~ pennatus           140
##  6 birds Egyptian vultu~ aves  accipitr~ accipitr~ neoph~ percnop~           140
##  7 birds gadwall         aves  anserifo~ anatidae  anas   strepera           140
##  8 birds northern brown~ aves  apterygi~ apterygi~ apter~ austral~           140
##  9 birds European night~ aves  caprimul~ caprimul~ capri~ europae~           140
## 10 birds oystercatcher   aves  charadri~ haematop~ haema~ ostrale~           140
## # ... with 130 more rows
```


```r
#lake fishes
#taxon 2/9
puddle_fin<-grepl("lake fishes", taxa$taxon)
splish<-filter(taxa, taxon=="lake fishes")
splish$taxa_recorded <-c(sum(puddle_fin))
splish
```

```
## # A tibble: 9 x 8
##   taxon   common_name   class    order    family   genus  species  taxa_recorded
##   <fct>   <chr>         <chr>    <fct>    <chr>    <chr>  <chr>            <int>
## 1 lake f~ american eel  actinop~ anguill~ anguill~ angui~ rostrata             9
## 2 lake f~ rock bass     actinop~ percifo~ centrar~ amblo~ rupestr~             9
## 3 lake f~ pumpkinseed   actinop~ percifo~ centrar~ lepom~ gibbosus             9
## 4 lake f~ bluegill      actinop~ percifo~ centrar~ lepom~ macroch~             9
## 5 lake f~ largemouth b~ actinop~ percifo~ centrar~ micro~ salmoid~             9
## 6 lake f~ white crappie actinop~ percifo~ centrar~ pomox~ annular~             9
## 7 lake f~ yellow perch  actinop~ percifo~ percidae perca  flavesc~             9
## 8 lake f~ brown trout   actinop~ salmoni~ salmoni~ salmo  trutta               9
## 9 lake f~ yellow bullh~ actinop~ silurif~ ictalur~ ictal~ natalis              9
```



```r
#lizards
#taxon 3/9
scaly_boi<-grepl("lizards", taxa$taxon)
parthenogenisis<-filter(taxa, taxon=="lizards")
parthenogenisis$taxa_recorded <-c(sum(scaly_boi))
parthenogenisis
```

```
## # A tibble: 11 x 8
##    taxon  common_name      class   order  family  genus   species  taxa_recorded
##    <fct>  <chr>            <chr>   <fct>  <chr>   <chr>   <chr>            <int>
##  1 lizar~ spiny tail liza~ reptil~ squam~ agamid~ uromas~ aegypti~            11
##  2 lizar~ Galapagos land ~ reptil~ squam~ iguani~ conolo~ pallidus            11
##  3 lizar~ Bahamian Andros~ reptil~ squam~ iguani~ cyclura cyclura             11
##  4 lizar~ blue iguana      reptil~ squam~ iguani~ cyclura lewisi              11
##  5 lizar~ Anegada ground ~ reptil~ squam~ iguani~ cyclura pinguis             11
##  6 lizar~ Angel island ch~ reptil~ squam~ iguani~ saurom~ hispidua            11
##  7 lizar~ common chuckwal~ reptil~ squam~ iguani~ saurom~ obesus              11
##  8 lizar~ desert iguana    reptil~ squam~ lacert~ dipsos~ dorsalis            11
##  9 lizar~ Tenerife lizard  reptil~ squam~ lacert~ gallot~ galloti             11
## 10 lizar~ High Mountain L~ reptil~ squam~ liolae~ phymat~ flagell~            11
## 11 lizar~ land mullet      reptil~ squam~ scinci~ egernia major               11
```



```r
#mammals
#taxon 4/9
mittens<-grepl("mammals", taxa$taxon)
snuggle_time<-filter(taxa, taxon=="mammals")
snuggle_time$taxa_recorded <-c(sum(mittens))
snuggle_time
```

```
## # A tibble: 238 x 8
##    taxon  common_name    class  order   family    genus   species  taxa_recorded
##    <fct>  <chr>          <chr>  <fct>   <chr>     <chr>   <chr>            <int>
##  1 mamma~ giant golden ~ mamma~ afroso~ chrysoch~ chryso~ trevely~           238
##  2 mamma~ Grant's golde~ mamma~ afroso~ chrysoch~ eremit~ granti             238
##  3 mamma~ pronghorn      mamma~ artiod~ antiloca~ antilo~ america~           238
##  4 mamma~ impala         mamma~ artiod~ bovidae   aepyce~ melampus           238
##  5 mamma~ hartebeest     mamma~ artiod~ bovidae   alcela~ buselap~           238
##  6 mamma~ barbary sheep  mamma~ artiod~ bovidae   ammotr~ lervia             238
##  7 mamma~ American bison mamma~ artiod~ bovidae   bison   bison              238
##  8 mamma~ European bison mamma~ artiod~ bovidae   bison   bonasus            238
##  9 mamma~ goat           mamma~ artiod~ bovidae   capra   hircus             238
## 10 mamma~ Spanish ibex   mamma~ artiod~ bovidae   capra   pyrenai~           238
## # ... with 228 more rows
```



```r
#marine fishes
#taxon 5/9
salt_face<-grepl("marine fishes", taxa$taxon)
fish_and_chips<-filter(taxa, taxon=="marine fishes")
fish_and_chips$taxa_recorded <-c(sum(salt_face))
fish_and_chips
```

```
## # A tibble: 90 x 8
##    taxon   common_name      class   order  family  genus  species  taxa_recorded
##    <fct>   <chr>            <chr>   <fct>  <chr>   <chr>  <chr>            <int>
##  1 marine~ pollack          actino~ gadif~ gadidae polla~ pollach~            90
##  2 marine~ saithe           actino~ gadif~ gadidae polla~ virens              90
##  3 marine~ lined surgeonfi~ actino~ perci~ acanth~ acant~ lineatus            90
##  4 marine~ orangespine uni~ actino~ perci~ acanth~ naso   liturat~            90
##  5 marine~ bluespine unico~ actino~ perci~ acanth~ naso   unicorn~            90
##  6 marine~ redlip blenny    actino~ perci~ blenni~ ophio~ atlanti~            90
##  7 marine~ giant trevally   actino~ perci~ carang~ caranx ignobil~            90
##  8 marine~ eastern triangu~ actino~ perci~ chaeto~ chaet~ barones~            90
##  9 marine~ Tahititan butte~ actino~ perci~ chaeto~ chaet~ trichro~            90
## 10 marine~ chevron butterf~ actino~ perci~ chaeto~ chaet~ trifasc~            90
## # ... with 80 more rows
```



```r
#river fishes
#taxon 6/9
fresh_fins<-grepl("river fishes", taxa$taxon)
salmon_run<-filter(taxa, taxon=="river fishes")
salmon_run$taxa_recorded <-c(sum(fresh_fins))
salmon_run
```

```
## # A tibble: 14 x 8
##    taxon   common_name   class    order    family  genus  species  taxa_recorded
##    <fct>   <chr>         <chr>    <fct>    <chr>   <chr>  <chr>            <int>
##  1 river ~ blacktail re~ actinop~ cyprini~ catost~ moxos~ poecilu~            14
##  2 river ~ central ston~ actinop~ cyprini~ cyprin~ campo~ anomalum            14
##  3 river ~ rosyside dace actinop~ cyprini~ cyprin~ clino~ fundulo~            14
##  4 river ~ longnose dace actinop~ cyprini~ cyprin~ rhini~ catarac~            14
##  5 river ~ muskellunge   actinop~ esocifo~ esocid~ esox   masquin~            14
##  6 river ~ longear sunf~ actinop~ percifo~ centra~ lepom~ megalot~            14
##  7 river ~ smallmouth b~ actinop~ percifo~ centra~ micro~ dolomieu            14
##  8 river ~ cutthroat tr~ actinop~ salmoni~ salmon~ oncor~ clarki              14
##  9 river ~ gila trout    actinop~ salmoni~ salmon~ oncor~ gilae               14
## 10 river ~ rainbow trout actinop~ salmoni~ salmon~ oncor~ mykiss              14
## 11 river ~ atlantic sal~ actinop~ salmoni~ salmon~ salmo  salar               14
## 12 river ~ mottled scul~ actinop~ scorpae~ cottid~ cottus bairdi              14
## 13 river ~ banded sculp~ actinop~ scorpae~ cottid~ cottus carolin~            14
## 14 river ~ sculpin       actinop~ scorpae~ cottid~ cottus gobio               14
```



```r
#snakes
#taxon 7/9
danger_noodle<-grepl("snakes", taxa$taxon)
wiggle_boi<-filter(taxa, taxon=="snakes")
wiggle_boi$taxa_recorded <-c(sum(danger_noodle))
wiggle_boi
```

```
## # A tibble: 41 x 8
##    taxon  common_name     class  order family  genus  species      taxa_recorded
##    <fct>  <chr>           <chr>  <fct> <chr>   <chr>  <chr>                <int>
##  1 snakes western worm s~ repti~ squa~ colubr~ carph~ vermis                  41
##  2 snakes eastern worm s~ repti~ squa~ colubr~ carph~ viridis                 41
##  3 snakes racer           repti~ squa~ colubr~ colub~ constrictor             41
##  4 snakes yellow bellied~ repti~ squa~ colubr~ colub~ constrictor~            41
##  5 snakes ringneck snake  repti~ squa~ colubr~ diado~ punctatus               41
##  6 snakes eastern indigo~ repti~ squa~ colubr~ dryma~ couperi                 41
##  7 snakes great plains r~ repti~ squa~ colubr~ elaphe guttata emo~            41
##  8 snakes western ratsna~ repti~ squa~ colubr~ elaphe obsoleta                41
##  9 snakes hognose snake   repti~ squa~ colubr~ heter~ platirhinos             41
## 10 snakes European whips~ repti~ squa~ colubr~ hiero~ viridiflavus            41
## # ... with 31 more rows
```



```r
#tortoises
#taxon 8/9
slow_boi<-grepl("tortoises", taxa$taxon)
winner_winner<-filter(taxa, taxon=="tortoises")
winner_winner$taxa_recorded <- c(sum(slow_boi))
winner_winner
```

```
## # A tibble: 12 x 8
##    taxon   common_name      class  order   family  genus  species  taxa_recorded
##    <fct>   <chr>            <chr>  <fct>   <chr>   <chr>  <chr>            <int>
##  1 tortoi~ red-footed tort~ repti~ testud~ testud~ geoch~ carbona~            12
##  2 tortoi~ desert tortoise  repti~ testud~ testud~ gophe~ agassiz~            12
##  3 tortoi~ gopher tortoise  repti~ testud~ testud~ gophe~ polyphe~            12
##  4 tortoi~ travancore tort~ repti~ testud~ testud~ indot~ travanc~            12
##  5 tortoi~ Speke's hinge-b~ repti~ testud~ testud~ kinix~ spekii              12
##  6 tortoi~ impressed torto~ repti~ testud~ testud~ manou~ impressa            12
##  7 tortoi~ bushmanland ten~ repti~ testud~ testud~ psamm~ tentori~            12
##  8 tortoi~ leopard tortoise repti~ testud~ testud~ stigm~ pardalis            12
##  9 tortoi~ spur-thighed to~ repti~ testud~ testud~ testu~ graeca              12
## 10 tortoi~ mediterranean t~ repti~ testud~ testud~ testu~ hermanii            12
## 11 tortoi~ Russian steppe ~ repti~ testud~ testud~ testu~ horsfie~            12
## 12 tortoi~ Egyptian tortoi~ repti~ testud~ testud~ testu~ kleinma~            12
```


```r
#turtles
#taxon 9/9 yay!
pond_bb<-grepl("turtles", taxa$taxon)
splash<-filter(taxa, taxon=="turtles")
splash$taxa_recorded <- c(sum(pond_bb))
splash
```

```
## # A tibble: 14 x 8
##    taxon  common_name      class  order   family  genus  species   taxa_recorded
##    <fct>  <chr>            <chr>  <fct>   <chr>   <chr>  <chr>             <int>
##  1 turtl~ Eastern long-ne~ repti~ testud~ chelid~ chelo~ longicol~            14
##  2 turtl~ Dalh's toad-hea~ repti~ testud~ chelid~ mesoc~ dahli                14
##  3 turtl~ common snapping~ repti~ testud~ chelyd~ chely~ serpenti~            14
##  4 turtl~ midland painted~ repti~ testud~ emydid~ chrys~ picta ma~            14
##  5 turtl~ chicken turtle   repti~ testud~ emydid~ deiro~ reticula~            14
##  6 turtl~ Blanding's turt~ repti~ testud~ emydid~ emydo~ blanding~            14
##  7 turtl~ European pond t~ repti~ testud~ emydid~ emys   orbicula~            14
##  8 turtl~ yellow-blotched~ repti~ testud~ emydid~ grapt~ flavimac~            14
##  9 turtl~ ornate box turt~ repti~ testud~ emydid~ terra~ ornata               14
## 10 turtl~ Spanish pond tu~ repti~ testud~ geoemy~ maure~ leprosa              14
## 11 turtl~ Eastern mud tur~ repti~ testud~ kinost~ kinos~ rubrubrum            14
## 12 turtl~ stripe-necked m~ repti~ testud~ kinost~ stern~ minor pe~            14
## 13 turtl~ stinkpot turtle  repti~ testud~ kinost~ stern~ odoratus             14
## 14 turtl~ Eastern spiny s~ repti~ testud~ triony~ apalo~ spinifera            14
```


```r
taxa_take2 <- rbind(tweeter, splish, parthenogenisis, snuggle_time, fish_and_chips, salmon_run, wiggle_boi, winner_winner, splash)
taxa_take2
```

```
## # A tibble: 569 x 8
##    taxon common_name     class order     family    genus  species  taxa_recorded
##    <fct> <chr>           <chr> <fct>     <chr>     <chr>  <chr>            <int>
##  1 birds golden eagle    aves  accipitr~ accipitr~ aquila chrysae~           140
##  2 birds common buzzard  aves  accipitr~ accipitr~ buteo  buteo              140
##  3 birds short-toed sna~ aves  accipitr~ accipitr~ circa~ gallicus           140
##  4 birds Bonelli's eagle aves  accipitr~ accipitr~ hiera~ fasciat~           140
##  5 birds booted eagle    aves  accipitr~ accipitr~ hiera~ pennatus           140
##  6 birds Egyptian vultu~ aves  accipitr~ accipitr~ neoph~ percnop~           140
##  7 birds gadwall         aves  anserifo~ anatidae  anas   strepera           140
##  8 birds northern brown~ aves  apterygi~ apterygi~ apter~ austral~           140
##  9 birds European night~ aves  caprimul~ caprimul~ capri~ europae~           140
## 10 birds oystercatcher   aves  charadri~ haematop~ haema~ ostrale~           140
## # ... with 559 more rows
```

#### 6. The species in `homerange` are also classified into trophic guilds. How many species are represented in each trophic guild?


```r
homerange2$trophic_guild<-as.factor(homerange2$trophic_guild)
levels(homerange2$trophic_guild)
```

```
## [1] "carnivore" "herbivore"
```

```r
filter(homerange2, trophic_guild=="carnivore")
```

```
## # A tibble: 342 x 24
##    taxon common_name class order family genus species primary_method n    
##    <fct> <chr>       <chr> <fct> <chr>  <chr> <chr>   <chr>          <chr>
##  1 lake~ american e~ acti~ angu~ angui~ angu~ rostra~ telemetry      16   
##  2 rive~ blacktail ~ acti~ cypr~ catos~ moxo~ poecil~ mark-recapture <NA> 
##  3 rive~ central st~ acti~ cypr~ cypri~ camp~ anomal~ mark-recapture 20   
##  4 rive~ rosyside d~ acti~ cypr~ cypri~ clin~ fundul~ mark-recapture 26   
##  5 rive~ longnose d~ acti~ cypr~ cypri~ rhin~ catara~ mark-recapture 17   
##  6 rive~ muskellunge acti~ esoc~ esoci~ esox  masqui~ telemetry      5    
##  7 mari~ pollack     acti~ gadi~ gadid~ poll~ pollac~ telemetry      2    
##  8 mari~ saithe      acti~ gadi~ gadid~ poll~ virens  telemetry      2    
##  9 mari~ giant trev~ acti~ perc~ caran~ cara~ ignobi~ telemetry      4    
## 10 lake~ rock bass   acti~ perc~ centr~ ambl~ rupest~ mark-recapture 16   
## # ... with 332 more rows, and 15 more variables: mean_mass_g <dbl>,
## #   log10_mass <dbl>, alternative_mass_reference <chr>, mean_hra_m2 <dbl>,
## #   log10_hra <dbl>, hra_reference <chr>, realm <chr>, thermoregulation <chr>,
## #   locomtion <chr>, trophic_guild <fct>, dimension <chr>, preymass <dbl>,
## #   log10_preymass <dbl>, ppmr <dbl>, prey_size_reference <chr>
```
*There are 24 carnivores*

```r
filter(homerange2, trophic_guild=="herbivore")
```

```
## # A tibble: 227 x 24
##    taxon common_name class order family genus species primary_method n    
##    <fct> <chr>       <chr> <fct> <chr>  <chr> <chr>   <chr>          <chr>
##  1 mari~ lined surg~ acti~ perc~ acant~ acan~ lineat~ direct observ~ <NA> 
##  2 mari~ orangespin~ acti~ perc~ acant~ naso  litura~ telemetry      8    
##  3 mari~ bluespine ~ acti~ perc~ acant~ naso  unicor~ telemetry      7    
##  4 mari~ redlip ble~ acti~ perc~ blenn~ ophi~ atlant~ direct observ~ 20   
##  5 mari~ bermuda ch~ acti~ perc~ kypho~ kyph~ sectat~ telemetry      11   
##  6 mari~ cherubfish  acti~ perc~ pomac~ cent~ argi    direct observ~ <NA> 
##  7 mari~ damselfish  acti~ perc~ pomac~ chro~ chromis direct observ~ <NA> 
##  8 mari~ twinspot d~ acti~ perc~ pomac~ chry~ biocel~ direct observ~ 18   
##  9 mari~ wards dams~ acti~ perc~ pomac~ poma~ wardi   direct observ~ <NA> 
## 10 mari~ australian~ acti~ perc~ pomac~ steg~ apical~ direct observ~ <NA> 
## # ... with 217 more rows, and 15 more variables: mean_mass_g <dbl>,
## #   log10_mass <dbl>, alternative_mass_reference <chr>, mean_hra_m2 <dbl>,
## #   log10_hra <dbl>, hra_reference <chr>, realm <chr>, thermoregulation <chr>,
## #   locomtion <chr>, trophic_guild <fct>, dimension <chr>, preymass <dbl>,
## #   log10_preymass <dbl>, ppmr <dbl>, prey_size_reference <chr>
```
*And 227 herbivores*


```r
filter(homerange2, trophic_guild!="herbivore",trophic_guild!="carnivore")
```

```
## # A tibble: 0 x 24
## # ... with 24 variables: taxon <fct>, common_name <chr>, class <chr>,
## #   order <fct>, family <chr>, genus <chr>, species <chr>,
## #   primary_method <chr>, n <chr>, mean_mass_g <dbl>, log10_mass <dbl>,
## #   alternative_mass_reference <chr>, mean_hra_m2 <dbl>, log10_hra <dbl>,
## #   hra_reference <chr>, realm <chr>, thermoregulation <chr>, locomtion <chr>,
## #   trophic_guild <fct>, dimension <chr>, preymass <dbl>, log10_preymass <dbl>,
## #   ppmr <dbl>, prey_size_reference <chr>
```
#### 7. Make two new data frames, one which is restricted to carnivores and another that is restricted to herbivores.


```r
meat_munch<-filter(homerange2, trophic_guild=="carnivore")
vegan<-filter(homerange2, trophic_guild=="herbivore")
meat_munch
```

```
## # A tibble: 342 x 24
##    taxon common_name class order family genus species primary_method n    
##    <fct> <chr>       <chr> <fct> <chr>  <chr> <chr>   <chr>          <chr>
##  1 lake~ american e~ acti~ angu~ angui~ angu~ rostra~ telemetry      16   
##  2 rive~ blacktail ~ acti~ cypr~ catos~ moxo~ poecil~ mark-recapture <NA> 
##  3 rive~ central st~ acti~ cypr~ cypri~ camp~ anomal~ mark-recapture 20   
##  4 rive~ rosyside d~ acti~ cypr~ cypri~ clin~ fundul~ mark-recapture 26   
##  5 rive~ longnose d~ acti~ cypr~ cypri~ rhin~ catara~ mark-recapture 17   
##  6 rive~ muskellunge acti~ esoc~ esoci~ esox  masqui~ telemetry      5    
##  7 mari~ pollack     acti~ gadi~ gadid~ poll~ pollac~ telemetry      2    
##  8 mari~ saithe      acti~ gadi~ gadid~ poll~ virens  telemetry      2    
##  9 mari~ giant trev~ acti~ perc~ caran~ cara~ ignobi~ telemetry      4    
## 10 lake~ rock bass   acti~ perc~ centr~ ambl~ rupest~ mark-recapture 16   
## # ... with 332 more rows, and 15 more variables: mean_mass_g <dbl>,
## #   log10_mass <dbl>, alternative_mass_reference <chr>, mean_hra_m2 <dbl>,
## #   log10_hra <dbl>, hra_reference <chr>, realm <chr>, thermoregulation <chr>,
## #   locomtion <chr>, trophic_guild <fct>, dimension <chr>, preymass <dbl>,
## #   log10_preymass <dbl>, ppmr <dbl>, prey_size_reference <chr>
```

```r
vegan
```

```
## # A tibble: 227 x 24
##    taxon common_name class order family genus species primary_method n    
##    <fct> <chr>       <chr> <fct> <chr>  <chr> <chr>   <chr>          <chr>
##  1 mari~ lined surg~ acti~ perc~ acant~ acan~ lineat~ direct observ~ <NA> 
##  2 mari~ orangespin~ acti~ perc~ acant~ naso  litura~ telemetry      8    
##  3 mari~ bluespine ~ acti~ perc~ acant~ naso  unicor~ telemetry      7    
##  4 mari~ redlip ble~ acti~ perc~ blenn~ ophi~ atlant~ direct observ~ 20   
##  5 mari~ bermuda ch~ acti~ perc~ kypho~ kyph~ sectat~ telemetry      11   
##  6 mari~ cherubfish  acti~ perc~ pomac~ cent~ argi    direct observ~ <NA> 
##  7 mari~ damselfish  acti~ perc~ pomac~ chro~ chromis direct observ~ <NA> 
##  8 mari~ twinspot d~ acti~ perc~ pomac~ chry~ biocel~ direct observ~ 18   
##  9 mari~ wards dams~ acti~ perc~ pomac~ poma~ wardi   direct observ~ <NA> 
## 10 mari~ australian~ acti~ perc~ pomac~ steg~ apical~ direct observ~ <NA> 
## # ... with 217 more rows, and 15 more variables: mean_mass_g <dbl>,
## #   log10_mass <dbl>, alternative_mass_reference <chr>, mean_hra_m2 <dbl>,
## #   log10_hra <dbl>, hra_reference <chr>, realm <chr>, thermoregulation <chr>,
## #   locomtion <chr>, trophic_guild <fct>, dimension <chr>, preymass <dbl>,
## #   log10_preymass <dbl>, ppmr <dbl>, prey_size_reference <chr>
```

#### 8. Do herbivores or carnivores have, on average, a larger `mean.hra.m2`? Remove any NAs from the data.


```r
mean(meat_munch$mean_hra_m2, na.rm = T)
```

```
## [1] 13039918
```

```r
mean(vegan$mean_hra_m2, na.rm=T)
```

```
## [1] 34137012
```
*Looks like the herbivores have a larger mean.hra.m2.*

#### 9. Make a new dataframe `deer` that is limited to the mean mass, log10 mass, family, genus, and species of deer in the database. The family for deer is cervidae. Arrange the data in descending order by log10 mass. Which is the largest deer? What is its common name?


```r
names(homerange2)
```

```
##  [1] "taxon"                      "common_name"               
##  [3] "class"                      "order"                     
##  [5] "family"                     "genus"                     
##  [7] "species"                    "primary_method"            
##  [9] "n"                          "mean_mass_g"               
## [11] "log10_mass"                 "alternative_mass_reference"
## [13] "mean_hra_m2"                "log10_hra"                 
## [15] "hra_reference"              "realm"                     
## [17] "thermoregulation"           "locomtion"                 
## [19] "trophic_guild"              "dimension"                 
## [21] "preymass"                   "log10_preymass"            
## [23] "ppmr"                       "prey_size_reference"
```

```r
homerange3<-select(homerange2,common_name,family,genus,species,mean_mass_g,log10_mass)
deer<-filter(homerange3, family=="cervidae")
deer
```

```
## # A tibble: 12 x 6
##    common_name       family   genus      species     mean_mass_g log10_mass
##    <chr>             <chr>    <chr>      <chr>             <dbl>      <dbl>
##  1 moose             cervidae alces      alces           307227.       5.49
##  2 chital            cervidae axis       axis             62823.       4.80
##  3 roe deer          cervidae capreolus  capreolus        24050.       4.38
##  4 red deer          cervidae cervus     elaphus         234758.       5.37
##  5 sika deer         cervidae cervus     nippon           29450.       4.47
##  6 fallow deer       cervidae dama       dama             71450.       4.85
##  7 Reeves's muntjac  cervidae muntiacus  reevesi          13500.       4.13
##  8 mule deer         cervidae odocoileus hemionus         53864.       4.73
##  9 white-tailed deer cervidae odocoileus virginianus      87884.       4.94
## 10 pampas deer       cervidae ozotoceros bezoarticus      35000.       4.54
## 11 pudu              cervidae pudu       puda              7500.       3.88
## 12 reindeer          cervidae rangifer   tarandus        102059.       5.01
```

```r
sort(deer$log10_mass, decreasing = T)
```

```
##  [1] 5.48746 5.37062 5.00885 4.94391 4.85400 4.79812 4.73130 4.54407 4.46909
## [10] 4.38112 4.13033 3.87506
```
*The largest deer's log10_mass is 5.48746. This corresponds to to the alces alces, the Moose!*

#### 10. As measured by the data, which snake species has the smallest homerange? Show all of your work, please. Look this species up online and tell me about it! Snake is found in taxon column


```r
homerange4<-select(homerange2, taxon,common_name,class,order,family,genus,species,mean_hra_m2)
snek<-filter(homerange4, taxon=="snakes")
snek
```

```
## # A tibble: 41 x 8
##    taxon  common_name     class   order  family  genus  species      mean_hra_m2
##    <fct>  <chr>           <chr>   <fct>  <chr>   <chr>  <chr>              <dbl>
##  1 snakes western worm s~ reptil~ squam~ colubr~ carph~ vermis               700
##  2 snakes eastern worm s~ reptil~ squam~ colubr~ carph~ viridis              253
##  3 snakes racer           reptil~ squam~ colubr~ colub~ constrictor       151000
##  4 snakes yellow bellied~ reptil~ squam~ colubr~ colub~ constrictor~      114500
##  5 snakes ringneck snake  reptil~ squam~ colubr~ diado~ punctatus           6476
##  6 snakes eastern indigo~ reptil~ squam~ colubr~ dryma~ couperi          1853000
##  7 snakes great plains r~ reptil~ squam~ colubr~ elaphe guttata emo~      150600
##  8 snakes western ratsna~ reptil~ squam~ colubr~ elaphe obsoleta           46000
##  9 snakes hognose snake   reptil~ squam~ colubr~ heter~ platirhinos       516375
## 10 snakes European whips~ reptil~ squam~ colubr~ hiero~ viridiflavus      110900
## # ... with 31 more rows
```

```r
sort(snek$mean_hra_m2, decreasing=F)
```

```
##  [1]     200.00     253.00     600.00     700.00    2400.00    2613.69
##  [7]    6476.00   10655.00   15400.00   17400.00   22900.00   27379.00
## [13]   28000.00   34800.00   34900.00   38800.00   40000.00   46000.00
## [19]   54200.00   60700.00   77400.00   96000.00   99000.00  110900.00
## [25]  114500.00  119288.89  131000.00  150600.00  151000.00  171600.00
## [31]  240400.00  245928.57  316000.00  374800.00  429300.00  495000.00
## [37]  516375.00  701000.00 1178000.00 1853000.00 2579600.00
```

```r
filter(snek, mean_hra_m2==200.00)
```

```
## # A tibble: 1 x 8
##   taxon  common_name        class   order   family   genus species   mean_hra_m2
##   <fct>  <chr>              <chr>   <fct>   <chr>    <chr> <chr>           <dbl>
## 1 snakes namaqua dwarf add~ reptil~ squama~ viperid~ bitis schneide~         200
```
*The namaque dwarf adder, spotted dwarf adder, or Schneider's adder is this little brown guy withblackish speckles. They like to hang out in Namibia, specifically on dunes near Luderitz. The description listed on Wikipedia mentions that this viper is the smallest viperid and chocks up the tiny homerange to low seasonality. He is smoll but very scary. Do not get bit.* 
