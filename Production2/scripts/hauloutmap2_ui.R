
library(shiny)
library(leaflet)
library(dplyr)
#library(tmap)





ui <- fluidPage(
  
  # App title ----
  titlePanel(tagList(img(src = 'noaanefsclogo.PNG'),br(),title='Seal Haulout Survey Locations'),
             tags$head(tags$link(rel = "icon", type = "image/png", href = "favicon.png")
             )
  ),
  # Input ----
  selectInput("mset", h3("Select Data to Map:"), 
              choices=list("Gray Seal Survey Sites" = "Hg",
                           "Harbor Seal Survey Sites" = "Pv"
                           #, 
                           #"Maine Bay units"= "MAINEBAYUNITS"
                           )


  ),
  
  # submit Button
 # actionButton("map", "map"),   
  
  # download Button
  #downloadButton("downloadData", "Download"),

  
  leafletOutput("mymap", width = "80%", height = 400)
  #,
  #p()
  #,
 # actionButton("recalc", "New points")
)

