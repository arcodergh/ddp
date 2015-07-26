data(mtcars)
mtcars$am <- as.factor(mtcars$am)
amLabel <- function(am) {
    if (am=='0') {
        return("Automatic")
    }else{
        return("Manual")
    }
}
fit <- lm(mpg ~ hp + am, data=mtcars)
mpgPredict <- function(hp, am) predict(fit, data.frame(hp = hp, am = am), se.fit = TRUE)[[1]]
shinyServer(
    function(input, output) {
        output$inputAM <- renderPrint({amLabel(input$am)})
        output$inputHP <- renderPrint({input$hp})
        output$prediction <- renderPrint({mpgPredict(input$hp,input$am)})
       
    }
)