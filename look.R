require(shiny)

## -----------------------------------------------
## Input controls
## -----------------------------------------------

sliderInput1 <- sliderInput(
  inputId = "bins1",
  label = "Number of bins (hist 1 & 2):",
  min = 1,
  max = 50,
  value = 30
)


sliderInput2 <- sliderInput(
  inputId = "bins2",
  label = "Number of bins (hist 3):",
  min = 1,
  max = 50,
  value = 30
)

sliderInput3 <- sliderInput(
  inputId = "bins3",
  label = "Number of bins (hist 4):",
  min = 1,
  max = 50,
  value = 30
)


## -----------------------------------------------
## User interface
## -----------------------------------------------

ui <- fluidPage(
  titlePanel("Hello Shiny!"),
  br(), br(),
  sidebarLayout(
    sidebarPanel(
      width = 3,
      sliderInput1
    ),
    mainPanel(
      width = 9,
      column(
        width = 8,
        plotOutput(outputId = "distPlot1")
      ),
      column(
        width = 4,
        plotOutput(outputId = "distPlot2")
      )
    )
  ),
  br(), br(),
  sidebarLayout(
    sidebarPanel(
      sliderInput2,
      sliderInput3
    ),
    mainPanel(
      tabsetPanel(
        tabPanel(
          "tab1",
          plotOutput(outputId = "distPlot3")
        ),
        tabPanel(
          "tab2",
          plotOutput(outputId = "distPlot4")
        )
      )
    )
  )
)

## -----------------------------------------------
## Data
## -----------------------------------------------

x <- faithful$waiting

## -----------------------------------------------
## Server
## -----------------------------------------------

server <- function(input, output) {
  output$distPlot1 <- renderPlot({
    bins1 <- seq(min(x), max(x), length.out = input$bins1 + 1)
    hist(x, breaks = bins1)
  })
  
  output$distPlot2 <- renderPlot({
    bins2 <- seq(min(x), max(x), length.out = input$bins1 + 1)
    hist(x, breaks = bins2)
  })
  
  output$distPlot3 <- renderPlot({
    bins2 <- seq(min(x), max(x), length.out = input$bins2 + 1)
    hist(x, breaks = bins2)
  })
  
  output$distPlot4 <- renderPlot({
    bins3 <- seq(min(x), max(x), length.out = input$bins3 + 1)
    hist(x, breaks = bins3)
  })
}

## -----------------------------------------------
## Create Shiny app
## -----------------------------------------------

shinyApp(ui = ui, server = server)