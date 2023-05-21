require(shiny)
require(ggplot2)
theme_set(theme_bw())

ui <- fluidPage(
  titlePanel("Exponent App"), 
  sliderInput(inputId = "exposant",
              label = "Choose the exponent n", 
              min = 0, max = 6,
              value = 0
              ), 
  plotOutput(outputId = "expo")
)
  
  
  
  
server1  <- function(input, output){
  
  output$expo <- renderPlot({
    x <- seq(-6,6, 0.01)
    plot(x, x^input$exposant, type = "l", ylab = "y", xlab = "x")
  })
  
}

server2 <- function(input, output) {
  
  output$expo <- renderPlot({
    ggplot()+ 
      xlim(-2,2)+
      stat_function(fun = \(x) x^input$exposant)+
      labs(subtitle = paste("Curve of y = x^n for n =", input$exposant))
  })
}

#shinyApp(ui, server2)