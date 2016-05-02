library(shiny)

shinyUI(fluidPage(
  headerPanel("Visualize Predictors of MPG using mtcars dataset"),
  
  # description and input
  sidebarPanel(
    h3('Select the predictor variable:'),
    selectInput('predictor', label='Predictor', selected='cyl', choices=names(mtcars)),
    h3('Documentation'),
    
    p("We use the mtcars dataset to plot the regression",
      "model using the selected variable with respect to mpg"),
  
    h5(a("Link to code on github", href="https://github.com/mlamanuzzi/MPGPredictors"))),
  # plot and output
  mainPanel(
    # div(h2("Developing Data Products: Coursera Project", style="color:#ff6600;margin:-65px 0px 10px 20px;")),
    
    h4(textOutput('text')),
    plotOutput('myPlot')),
    h4('Summary of Selected Attribute'),
    h4(verbatimTextOutput("summary"))
))