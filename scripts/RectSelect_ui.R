ui <- fluidPage(# Application title
  titlePanel("Pup Counts"),
  mainPanel(
    tabsetPanel(
      tabPanel("Gray Seals", 
               fluidRow(
                 column(6, dataTableOutput("my_table3")),
                 column(6, dataTableOutput("my_map3"))
               ),
          h4("Summary of selected data"),
      verbatimTextOutput("summary")
    ),
      tabPanel("Harbor Seals", dataTableOutput("my_table3"))
    )
  ))


