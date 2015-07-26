shinyUI(pageWithSidebar(
    headerPanel("Shiny Application"),
    
    
    sidebarPanel(
        selectInput("am", "Transmission Type:", c("Automatic" = "0","Manual" = "1")),
        sliderInput('hp', 'Gross Horsepower',value = 150, min = 10, max = 300, step = 5)
    ),

    mainPanel(
        helpText("Note: This Shiny application offer a prediction about the miles per gallon that a vehicle",
                 " can offer depending of its transmission type and gross horsepower, the prediction",
                 "model is based on a simple linear model built using the mtcars dataset."),
        h3('Results of prediction'),
        h4('Transmission Type:'),
        verbatimTextOutput("inputAM"),
        h4('Gross Horsepower:'),
        verbatimTextOutput("inputHP"),
        h4('Which resulted in a prediction of '),
        verbatimTextOutput("prediction")
    )
))