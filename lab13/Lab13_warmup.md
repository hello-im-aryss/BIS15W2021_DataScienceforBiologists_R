---
title: "Lab 13 Warmup"
author: "Aryss Hearne"
date: "2/25/2021"
output: 
  html_document: 
    keep_md: yes
---




```r
#install.packages("shiny")
library(shiny)
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
library(palmerpenguins)
#install.packages("shinydashboard")
library(shinydashboard)
```

```
## 
## Attaching package: 'shinydashboard'
```

```
## The following object is masked from 'package:graphics':
## 
##     box
```

#Part 1


```r
ui<-fluidPage()
server<-function(input,output,session){}
shinyApp(ui,server)
```

`<div style="width: 100% ; height: 400px ; text-align: center; box-sizing: border-box; -moz-box-sizing: border-box; -webkit-box-sizing: border-box;" class="muted well">Shiny applications not supported in static R Markdown documents</div>`{=html}


```r
names(penguins)
```

```
## [1] "species"           "island"            "bill_length_mm"   
## [4] "bill_depth_mm"     "flipper_length_mm" "body_mass_g"      
## [7] "sex"               "year"
```

```r
ui<-fluidPage(
  selectInput("x", "Select X Variable", choices=c("bill_length_mm", "bill_depth_mm", "flipper_length_mm", "body_mass_g"),
              selected = "bill_length_mm")
)
server<-function(input,output,session){
}
shinyApp(ui,server)
```

`<div style="width: 100% ; height: 400px ; text-align: center; box-sizing: border-box; -moz-box-sizing: border-box; -webkit-box-sizing: border-box;" class="muted well">Shiny applications not supported in static R Markdown documents</div>`{=html}


```r
ui<-fluidPage(
  selectInput("x", "Select X Variable", choices=c("bill_length_mm", "bill_depth_mm", "flipper_length_mm", "body_mass_g"),
              selected = "bill_length_mm"),
  selectInput("y", "Select Y Variable", choices=c("bill_length_mm", "bill_depth_mm", "flipper_length_mm", "body_mass_g"),
              selected = "bill_length_mm")
)
server<-function(input,output,session){
}
shinyApp(ui,server)
```

`<div style="width: 100% ; height: 400px ; text-align: center; box-sizing: border-box; -moz-box-sizing: border-box; -webkit-box-sizing: border-box;" class="muted well">Shiny applications not supported in static R Markdown documents</div>`{=html}


```r
ui<-fluidPage(
  selectInput("x", "Select X Variable", choices=c("bill_length_mm", "bill_depth_mm", "flipper_length_mm", "body_mass_g"),
              selected = "bill_length_mm"),
  selectInput("y", "Select Y Variable", choices=c("bill_length_mm", "bill_depth_mm", "flipper_length_mm", "body_mass_g"),
              selected = "bill_length_mm")
)
server<-function(input,output,session){
  reactive({input$x
    input$y})
}
shinyApp(ui,server)
```

`<div style="width: 100% ; height: 400px ; text-align: center; box-sizing: border-box; -moz-box-sizing: border-box; -webkit-box-sizing: border-box;" class="muted well">Shiny applications not supported in static R Markdown documents</div>`{=html}


```r
ui<-fluidPage(
  selectInput("x", "Select X Variable", choices=c("bill_length_mm", "bill_depth_mm", "flipper_length_mm", "body_mass_g"),
              selected = "bill_length_mm"),
  selectInput("y", "Select Y Variable", choices=c("bill_length_mm", "bill_depth_mm", "flipper_length_mm", "body_mass_g"),
              selected = "bill_length_mm"),
  plotOutput("plot", width="500px", height="400px")
)
server<-function(input, output, session){
  output$plot<-renderPlot({
    ggplot(penguins, aes_string(x=input$x, y=input$y, color="species"))+
      geom_point()+
      theme_light(base_size = 18)
  })
}
shinyApp(ui,server)
```

`<div style="width: 100% ; height: 400px ; text-align: center; box-sizing: border-box; -moz-box-sizing: border-box; -webkit-box-sizing: border-box;" class="muted well">Shiny applications not supported in static R Markdown documents</div>`{=html}
#### Practice


```r
homerange<-readr::read_csv("data/Tamburelloetal_HomeRangeDatabase.csv")
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
ui <- fluidPage(    
  
  titlePanel("Log 10 Homerange by Taxon"), # give the page a title
  
  # generate a row with a sidebar
  sidebarLayout(      
    
    # define the sidebar with one input
    sidebarPanel(
      selectInput("taxon", " Select Taxon of Interest:", 
                  choices=unique(homerange$taxon)),
      hr(),
      helpText("Reference: Tamburello N, Cote IM, Dulvy NK (2015) Energy and the scaling of animal space use. The American Naturalist 186(2):196-211.")
    ),
    
    # create a spot for the barplot
    mainPanel(
      plotOutput("taxonPlot")  
    )
    
  )
)

# define a server for the Shiny app
server <- function(input, output) {
  
  # fill in the spot we created for a plot
  output$taxonPlot <- renderPlot({
    
    homerange %>% 
    filter(taxon == input$taxon) %>% 
    ggplot(aes(x=log10.hra)) + 
    geom_density(color="black", fill="steelblue", alpha=0.6)
  })
}

shinyApp(ui, server)
```

`<div style="width: 100% ; height: 400px ; text-align: center; box-sizing: border-box; -moz-box-sizing: border-box; -webkit-box-sizing: border-box;" class="muted well">Shiny applications not supported in static R Markdown documents</div>`{=html}

