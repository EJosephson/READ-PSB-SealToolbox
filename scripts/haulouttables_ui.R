

ui <- fluidPage(

  # App title ----
  titlePanel(tagList(img(src = 'noaanefsclogo.PNG'),br(),title='Northeast US Seal Haulout Sites'),
             tags$head(tags$link(rel = "icon", type = "image/png", href = "favicon.png")
             )
  ),

  
  fluidRow(
    column(10,
    
    # Input ----
    selectInput("dset", h3("Select Table to View:"), 
                choices=list("Gray Seal Haulouts" = "HAULOUTS",
                             "Maine Pv sites" = "MAINEWAYPOINTS2", 
                             "Maine Bay units"= "MAINEBAYUNITS")
    )
     ),
  ),
  
  fluidRow(
    # submit Button
    actionButton("yes", "Load to Screen"),    
  ),

  # Main panel for displaying outputs ----
  mainPanel(
    
    # Output: table ----
    div(style = 'overflow-x: scroll', DT::dataTableOutput('birdTable'))
  )# close mainPanel
    ) #close fluidPage
#)
