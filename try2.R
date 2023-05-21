require(shiny)

## -----------------------------------------------
## User interfaces
## -----------------------------------------------

#------  UI 1  ------
ui1 <- fluidPage(
  titlePanel("Fluid page"), # title
  # contents ----
  paste(rep(LETTERS, 20), collapse = " "),
  paste(1:150, collapse = " "),
  paste(rep(letters, 40), collapse = " "),
  paste(rep(LETTERS, 40), collapse = " "),
  paste(1:300, collapse = " "),
  paste(rep(letters, 40), collapse = " ")
)

#------  UI 2  ------
ui2 <- fluidPage(
  titlePanel("Rows"),
  # row 1 ----
  fluidRow(
    # contents of row 1 ----
    paste(rep(LETTERS, 20), collapse = " "),
    paste(1:150, collapse = " "),
    paste(rep(letters, 40), collapse = " "),
    paste(rep(LETTERS, 40), collapse = " ")
  ),
  br(), # line break
  # row 2 ----
  fluidRow(
    # contents of row 2 ----
    paste(1:300, collapse = " "),
    paste(rep(letters, 40), collapse = " ")
  )
)

#------  UI 3  ------
ui3 <- fluidPage(
  titlePanel("Rows & Columns"),
  # row 1 ----
  fluidRow(
    # column 1 ----
    column(
      4, # length of the column
      # contents of row 1, column 1 ----
      paste(rep(LETTERS, 20), collapse = " "),
      br(),
      br(),
      paste(1:150, collapse = " ")
    ),
    # column 2 ----
    column(
      4,
      # contents of row 1, column 2 ----
      paste(rep(letters, 40), collapse = " ")
    ),
    # column 3 ----
    column(
      4,
      # contents of row 1, column 3 ----
      paste(rep(LETTERS, 40), collapse = " ")
    )
  ),
  br(),
  # row 2 ----
  fluidRow(
    # column 1 ----
    column(
      4,
      paste(1:300, collapse = " ")
    ),
    # column 2 ----
    column(
      8,
      paste(rep(letters, 40), collapse = " ")
    )
  )
)

#------  UI 4  ------
ui4 <- fluidPage(
  titlePanel("Panel"),
  fluidRow(
    column(
      4,
      # panel
      wellPanel(
        # contents of the panel
        paste(rep(LETTERS, 10), collapse = " "),
        br(),
        br(),
        paste(1:150, collapse = " ")
      ),
      paste(1:100, collapse = " ")
    ),
    column(
      4,
      paste(rep(letters, 40), collapse = " ")
    ),
    column(
      4,
      paste(rep(LETTERS, 40), collapse = " ")
    )
  )
)

#------  UI 5  ------
ui5 <- fluidPage(
  titlePanel("Panel + Tabs"),
  fluidRow(
    column(
      4,
      # panel
      wellPanel(
        paste(rep(LETTERS, 20), collapse = " "),
        br(),
        br(),
        paste(1:150, collapse = " ")
      )
    ),
    column(
      8,
      # tabs layout
      tabsetPanel(
        # tab 1
        tabPanel(
          title = "Tab1",
          br(),
          paste(rep(letters, 50), collapse = " "),
          br(),
          br(),
          paste(rep(LETTERS, 30), collapse = " ")
        ),
        # tab 2
        tabPanel(
          title = "Tab2",
          br(),
          paste(1:300, collapse = " "),
          br(),
          br(),
          paste(rep(LETTERS, 50), collapse = " ")
        )
      )
    )
  )
)

#------  UI 6  ------
ui6 <- fluidPage(
  titlePanel("Sidebar layout"),
  # sidebar layout
  sidebarLayout(
    # side panel
    sidebarPanel(
      width = 3, # width of the panel (default 4)
      paste(rep(LETTERS, 10), collapse = " "),
      br(),
      br(),
      paste(1:150, collapse = " ")
    ),
    # main panel
    mainPanel(
      width = 9,
      paste(rep(letters, 50), collapse = " "),
      br(),
      br(),
      paste(rep(LETTERS, 30), collapse = " ")
    )
  )
)

## -----------------------------------------------
## Server
## -----------------------------------------------

server <- function(input, output) { }

## -----------------------------------------------
## Create Shiny app
## -----------------------------------------------

# replace ui by ui1, ui2,..., ui6.
# shinyApp(ui = ui, server = server) 