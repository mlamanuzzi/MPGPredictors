library(shiny)
library(ggplot2)
library(datasets)
require(graphics)

shinyServer(function(input, output) {
  getPredictorString <- reactive({
    paste("mpg ~", "as.integer(", input$predictor,")")
  })
  
  fit <- reactive({
    lm(as.formula(getPredictorString()), data=mtcars)
  })
  
  output$summary <- renderPrint({
    summary(mtcars[,input$predictor])
  })
  
  output$text <- renderText({
    paste("Regression Model:", "mpg ~", input$predictor)
  })
  
  output$myPlot <- renderPlot ({
    with(mtcars, {plot(as.formula(getPredictorString()), xlab=input$predictor, ylab="Miles per Gallon (MPG)")
      abline(fit(), col="red")
    })
  })
})