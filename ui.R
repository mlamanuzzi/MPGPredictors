library(shiny)

shinyUI(fluidPage(
  headerPanel(h2("Visualize Predictors of MPG using mtcars dataset") ),
  
  # description and input
  sidebarPanel(
    h3('Input Panel'),
    p('Select the predictor variable with mpg as outcome:'),
    selectInput('predictor', label='Predictor', selected='cyl', choices=names(mtcars)),
    h3('Documentation'),
    p("This project uses the 'mtcars' dataset to plot the",
      "regression model using two variables of this dataset:",
      "one as predictor, what we have to choose, and the",
      "other is 'mpg' as the outcome."),
    
    p("It is simple to use and when the predictor is selected",
      "the plot is updated putting the new fit.")),
  
  # plot and output
  mainPanel(
    # div(h2("Developing Data Products: Coursera Project", style="color:#ff6600;margin:-65px 0px 10px 20px;")),
    
    h4(textOutput('text')),
    plotOutput('myPlot')),
    h4('Summary of Selected Attribute'),
    h4(verbatimTextOutput("summary"))
  
))