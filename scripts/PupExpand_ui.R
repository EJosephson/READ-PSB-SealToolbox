ui <- fluidPage(# Application title
  titlePanel("Pup Counts"),
  mainPanel(
    tabsetPanel(
      tabPanel("Gray Seals", dataTableOutput("my_table"))
      #,
     # tabPanel("Harbor Seals", dataTableOutput("my_table2"))
    )
  ))