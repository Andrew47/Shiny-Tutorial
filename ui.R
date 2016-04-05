library(shiny)

shinyUI(fluidPage(
  
  # Application title
  titlePanel("Visualisation of US Census"),
  
  sidebarLayout(
    sidebarPanel(p(
      "Create demographic maps with information from the 2010 US Census."),
      br(),
      p("Choose a variable to display"),
      
      selectInput("var",
        choices = c("% White","% Black", "% Hispanic", "% Asian"),
        label = NULL
      ),
      
      sliderInput("range",
                  label = "Range of Interest:",
                  min = 0,
                  max = 100,
                  value = c(0,100))),
    mainPanel("Text Reaction:",
              textOutput("text1"),
              plotOutput("map"))
  )
))


