


runPlotDens <-  function(){

  PlotDens <- function(a = -1, b = 1, mean = 0, sd = 1, df = 1) {
    require(ggplot2)
    theme_set(theme_minimal())
    x_value <-  seq(-5,5, length = 200)
    ggplot(data.frame(x_value), aes(x = x_value, linetype = paste0("Normal (mean = ", mean, ",sd = ", sd,")\nP(a < X < b) = ", round(pnorm(a, mean = mean, sd = sd,  lower.tail = FALSE) - pnorm(b,mean = mean, sd = sd, lower.tail = FALSE),3)), color = paste0("Student's t-distribution (df = ", df, ")\nP(a < X < b) = ", round(pt(a, df = df  ,lower.tail = FALSE) - pt(b,df = df  ,lower.tail = FALSE),3))))+
      stat_function(fun = dnorm, args = list(mean = mean, sd = sd), col = "red", size = 1, alpha = 0.9)+
      stat_function(geom = "area", fill = "red", alpha = 0.2, fun = dnorm, args = list(mean = mean, sd = sd), xlim = c(a,b), show.legend = FALSE)+
      stat_function(fun = dt, args = list(df), col = "skyblue", size = 1, alpha = 1)+
      stat_function(geom = "area", fill = "red", alpha = 0.2, fun = dt, args = list(df = df), xlim = c(a,b))+
      geom_segment(x = a, y = 0, xend = a, yend = dnorm(a, mean = mean, sd = sd), linetype = 2, col = 1)+
      geom_segment(x = b, y = 0, xend =b, yend = dnorm(b, mean = mean, sd = sd), linetype = 2, col = 1)+
      annotate("text", x=a, y =-0.003, label = "a")+
      annotate("text", x = b, y = -0.003, label = "b")+
      labs(x = "", y = "density", linetype = "", color = "")+
      theme(legend.position = "top")
  }
  
  PlotDensn <- function(a = -1, b = 1, mean = 0, sd = 1) {
    require(ggplot2)
    theme_set(theme_minimal())
    x_value <-  seq(-5,5, length = 200)
    ggplot(data.frame(x_value), aes(x = x_value, linetype = paste0("Normal (mean = ", mean, ",sd = ", sd,")\nP(a < X < b) = ", round(pnorm(a, mean = mean, sd = sd,  lower.tail = FALSE) - pnorm(b,mean = mean, sd = sd, lower.tail = FALSE),3))))+
      stat_function(fun = dnorm, args = list(mean = mean, sd = sd), col = "red", size = 1, alpha = 0.9)+
      stat_function(geom = "area", fill = "red", alpha = 0.3, fun = dnorm, args = list(mean = mean, sd = sd), xlim = c(a,b), show.legend = FALSE)+
      geom_segment(x = a, y = 0, xend = a, yend = dnorm(a, mean = mean, sd = sd), linetype = 2, col = 1)+
      geom_segment(x = b, y = 0, xend =b, yend = dnorm(b, mean = mean, sd = sd), linetype = 2, col = 1)+
      annotate("text", x=a, y =-0.003, label = "a")+
      annotate("text", x = b, y = -0.003, label = "b")+
      labs(x = "", y = "density", linetype = "", color = "  ")+
      theme(legend.position = "top")
  }
  
  PlotDenst <- function(a = -1, b = 1, df = 1) {
    require(ggplot2)
    theme_set(theme_minimal())
    x_value <-  seq(-5,5, length = 200)
    ggplot(data.frame(x_value), 
           aes(x = x_value, 
               linetype = paste0("Student's t-distribution (df = ", 
                                 df,
                                 ")\nP(a < X < b) = ", 
                                 round(pt(a, df = df  ,lower.tail = FALSE) - pt(b,df = df  ,lower.tail = FALSE),3))))+
      stat_function(fun = dt, args = list(df), col = "red", size = 1, alpha = 0.9)+
      stat_function(geom = "area", fill = "pink", alpha = 0.3, fun = dt, args = list(df = df), xlim = c(a,b), show.legend = FALSE)+
      geom_segment(x = a, y = 0, xend = a, yend = dt(a, df = df), linetype = 2, col = 1)+
      geom_segment(x = b, y = 0, xend =b, yend = dt(b, df = df), linetype = 2, col = 1)+
      annotate("text", x=a, y =-0.003, label = "a")+
      annotate("text", x = b, y = -0.003, label = "b")+
      labs(x = "", y = "density", linetype = "")+
      theme(legend.position = "top")
  }
  
  
  require(shiny)

  ui <- fillPage(fluidPage(titlePanel("Normal vs Student"),
                           sidebarLayout(sidebarPanel(
                             sliderInput(inputId = "mean",
                                         label = "Mean - Normal",
                                         min = -5,
                                         max = 5,
                                         value = 0,
                                         step = 0.5),
                             
                             sliderInput(inputId = "deviation",
                                         label = "Standard Deviation ('sd') - Normal",
                                         min = 0.1,
                                         max = 3,
                                         value = 1,
                                         step = 0.1),
                             
                             sliderInput(inputId = "df",
                                         label = "Degree of freedom ('df') - Student",
                                         min = 1,
                                         max = 50,
                                         value = 1,
                                         step = 1),
                             
                             sliderInput(inputId = "range",
                                         label = "Interval (a,b)",
                                         min = -5,
                                         max = 5,
                                         value = c(-1,1),
                                         step = 0.5),
                             
                             radioButtons(inputId = "todisplay",
                                          label = "Output",
                                          choices = c("Overlay",
                                                      "Normal",
                                                      "Student"),
                                          selected = "Overlay",
                                          inline = TRUE)),
                             mainPanel(wellPanel(plotOutput("plot")))
                           )), padding = 20)
    
  server <- function(input, output) {
          output$plot <- renderPlot({
            if (input$todisplay == "Overlay") {
              PlotDens(a = input$range[1], b = input$range[2], 
                       mean = input$mean, sd =input$deviation,
                       df = input$df)
            } else {
              
              if(input$todisplay == "Normal") {
              PlotDensn(a = input$range[1], b = input$range[2], 
                        mean = input$mean, sd = input$deviation)}
              else {if (input$todisplay == "Student") {
              PlotDenst(a = input$range[1], b = input$range[2],
                        df = input$df)}}
            }
            })
  
  }
  
  runApp(shinyApp(ui, server))
}