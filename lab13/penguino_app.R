library("shiny")
library("naniar")
library("tidyverse")
library("shinydashboard")
library("palmerpenguins")


ui <- dashboardPage(
  dashboardHeader(title = "Penguins"),
  dashboardSidebar(disable = T),
  dashboardBody(
    fluidRow(
      box(title = "Plot Options", width = 3,
          selectInput("x", "Select X Variable", choices = c("bill_length_mm", "bill_depth_mm", "flipper_length_mm", "body_mass_g"), selected = "bill_length_mm"),
          selectInput("y", "Select Y Variable", choices = c("bill_length_mm", "bill_depth_mm", "flipper_length_mm", "body_mass_g"), selected = "bill_depth_mm"),
          sliderInput("pointsize", "Select the Point Size", min = 1, max = 5, value = 2, step = 0.5)
      ), # close the first box
      box(title = "Plot of Penguins Data", width = 7,
          plotOutput("plot", width = "600px", height = "500px")
      ) # close the second box
    ) # close the row
  ) # close the dashboard body
) # close the ui

server <- function(input, output, session) { 
  output$plot <- renderPlot({
    ggplot(penguins, aes_string(x = input$x, y = input$y, color="species")) + geom_point(size=input$pointsize, alpha=0.8) + theme_light(base_size = 18)
  })
  session$onSessionEnded(stopApp)
}

shinyApp(ui, server)


