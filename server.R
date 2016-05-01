library(shiny)
library(ggplot2)
library(datasets)
require(graphics)

shinyServer(function(input, output) {
  myXY <- reactive({
    paste("mpg ~", "as.integer(", input$predictor,")")
  })
  
  myFit <- reactive({
    lm(as.formula(myXY()),data=mtcars)
  })
  
  output$summary <- renderPrint({
    predictor <- input$predictor
    if(predictor == "cyl")
      summary(mtcars$cyl)
    else if(predictor == "disp")
      summary(mtcars$disp)
    else if(predictor == "hp")
      summary(mtcars$hp)
    else if(predictor == "drat")
      summary(mtcars$drat)
    else if(predictor == "wt")
      summary(mtcars$wt)
    else if(predictor == "qsec")
      summary(mtcars$qsec)
    else if(predictor == "vs")
      summary(mtcars$vs)
    else if(predictor == "am")
      summary(mtcars$am)
    else if(predictor == "gear")
      summary(mtcars$gear)
    else if(predictor == "carb")
      summary(mtcars$carb)
    else if(predictor == "mpg")
      summary(mtcars$mpg)
    
  })
  
  
  output$text <- renderText({
    paste("Regression Model:", "mpg ~", input$predictor)
  })
  
  output$myPlot <- renderPlot ({
    with(mtcars, {plot(as.formula(myXY()), xlab=input$predictor, ylab="Miles per Gallon (MPG)")
      abline(myFit())
    })
  })
})