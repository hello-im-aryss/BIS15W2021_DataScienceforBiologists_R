library(tidyverse)
library(janitor)
library(here)
library(ggmap)
library(albersusa)
library(ggthemes)
uc_admit<-readr::read_csv("data/UC_admit.csv")
uc_admit<-clean_names(uc_admit)
uc_admit2<-uc_admit%>%
  mutate(percent_fr=str_replace(perc_fr, "%", ""))%>%
  select(campus, academic_yr, category, ethnicity, percent_fr, filtered_count_fr)%>%
  filter(ethnicity!="All")
uc_admit2$academic_yr<-as.factor(uc_admit2$academic_yr)
uc_admit2$percent_fr<-as.numeric(uc_admit2$percent_fr)




ui<-dashboardPage(
  dashboardHeader(title="UC Data by Ethnicity"),
  dashboardSidebar(disable=T),
  dashboardBody(
    fluidRow(
      box(title="Data Select", width=10,
          selectInput("x", "Select X Variable", choices=c("campus", "academic_yr", "category"),
                      selected="campus"),
          plotOutput("plot", width="700px", height="400px")
      ))))
server<-function(input, output, session){
  output$plot<-renderPlot({
    uc_admit2%>%
      ggplot(aes_string(x=input$x, y="percent_fr", fill="ethnicity", group="ethnicity"))+
      geom_col()+
      theme_solarized(base_size=18)+
      theme(legend.position="right",
            axis.text.x=element_text(angle=60, hjust=1))+
      coord_flip()
  })
  session$onSessionEnded(stopApp)
}
shinyApp(ui,server)
