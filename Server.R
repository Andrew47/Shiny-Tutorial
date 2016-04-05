#Following packages were installed:

#install.packages("shiny")
#install.packages(c("maps","mapproj"))

library(shiny)

source("helpers.R")
counties <- readRDS("/Users/andrewburnie/Desktop/Projects/self-taught-languages/R/Shiny Knowledge/data/counties.rds")
library(maps)
library(mapproj)


shinyServer(function(input, output) {
  output$text1 <- renderText({
    paste("You have selected", input$var)
  })
  
  output$map <- renderPlot({
    data <- switch(input$var,
                   "% White" = counties$white,
                   "% Black" = counties$black,
                   "% Hispanic" = counties$hispanic,
                   "% Asian" = counties$asian)
    
    percent_map(
      var = data, 
      color = "skyblue", 
      legend.title = "Census Data", 
      max = input$range[2], 
      min = input$range[1])
  })
})

?switch
