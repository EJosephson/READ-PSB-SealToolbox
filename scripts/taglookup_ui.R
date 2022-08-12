

ui <- fluidPage(
  
  # App title ----
  titlePanel(tagList(img(src = 'noaanefsclogo.PNG'),br(),title='Pinniped Tag Lookup'),
             tags$head(tags$link(rel = "icon", type = "image/png", href = "favicon.png")
             )
  ),
  
  # Sidebar layout with input and output definitions ----
 #  sidebarLayout(
  
  # Sidebar panel for inputs ----
#  sidebarPanel(
fluidRow(
  column(5,   
    # Input ----
    selectInput("tagtype", h3("Select Sampled Animal Type:"), 
                choices=list("Research Tag" = "research",
                             "Bycatch Tag" = "bycatch", 
                             "Stranding Tag"= "stranding")
    )
     ),
  column(5,
    textInput("txt", h3("Enter a tag number:"))
  ),
),
fluidRow(  
    # submit Button
    actionButton("k", "Load to Screen")    
  ),

  # Main panel for displaying outputs ----
  mainPanel(
    # Output: table ----
    tableOutput("tagtable")
    #,
    #tableOutput("tagtable2")
  )# close mainPanel
) #close fluidPage
#)
