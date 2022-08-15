library(shiny)
library(leaflet)
library(dplyr)
#library(tmap)





#r_colors <- rgb(t(col2rgb(colors()) / 255))
#names(r_colors) <- colors()

ui <- fluidPage(
  
  # App title ----
  titlePanel(tagList(img(src = 'noaanefsclogo.PNG'),br(),title='Seabird Sightings'),
             tags$head(tags$link(rel = "icon", type = "image/png", href = "favicon.png")
             )
  ),
  # Input ----
  selectInput("birdsp", h3("Select Species:"), 
               choices=list("Common Dolphin" = "Common Dolphin",
                           "Minke Whale" = "Minke Whale", 
                           "Fin Whale"= "Fin Whale")



  ),
  
  # submit Button
  actionButton("map", "map"),   
  
  # download Button
  #downloadButton("downloadData", "Download"),

  
  leafletOutput("mymap", width = "60%", height = 400)
  #,
  #p()
  #,
 # actionButton("recalc", "New points")
)

