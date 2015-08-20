library(shiny)
library(ggplot2)
data <- Seatbelts


## Define a server for the Shiny app
shinyServer(function(input, output) {
  
  ## Fill in the spot we created for a plot
  output$plot1 <- renderPlot({
    
    ## Render a barplot
    plot(data[,input$X],data[,input$Y],
            main=paste(input$Y, "per", input$X),
            ylab=input$Y,
            xlab=paste(input$X))
    lines(lowess(data[,input$X],data[,input$Y]),col = "blue")
    lines(predict.lm(lm(data[,input$Y]~data[,input$X], data = data),data[,input$X]),col = "red")
    legend("topright",c(paste("Lowess approx"),paste("Linear Model From",input$X)),lty=c(1,1),col=c("blue","red"))
  })
})