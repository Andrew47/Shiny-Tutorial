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
    args <- switch(input$var,
                   "% White" = list(counties$white, "darkblue"),
                   "% Black" = list(counties$black, "black"),
                   "% Hispanic" = list(counties$hispanic, "darkorange"),
                   "% Asian" = list(counties$asian, "darkgreen"))
                   
                  args$min <- input$range[1]
                  args$max <- input$range[2]
                  args$legend.title <- "US Census Data"
    
                  do.call(percent_map, args)
    
})
})
