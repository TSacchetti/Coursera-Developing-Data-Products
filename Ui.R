library(shiny)
library(ggplot2)
# Define the overall UI
shinyUI(
  
  # Use a fluid Bootstrap layout
  fluidPage(
    
    # Give the page a title
    titlePanel("Exploration of Car Fatality Statistics in the city of London"),
    
    # Generate a row with a sidebar
    sidebarLayout(
      
      # Define the sidebar with one input
      sidebarPanel(
        selectInput("X", "X Value:",
                    choices= colnames(Seatbelts)),
        selectInput("Y", "Y Value:",
                    choices=colnames(Seatbelts),selected = "drivers"),
        sliderInput("N",
                    "Lowess fit:",
                    min = 0,  max = 1, value = .5),
        hr(),
        helpText("Data from my Seatbelt dataset Preloaded to R", br(),
                 "Select your categories you would like to compare.")),
      
      # Create a spot for the barplot
      mainPanel(
        plotOutput("plot1")))))