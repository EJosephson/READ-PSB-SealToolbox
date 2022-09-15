library(shiny)
library(crosstalk)
library(leaflet)
library(DT)
library(dplyr)

# Wrap data frame in SharedData
# Use SharedData like a dataframe with Crosstalk-enabled widgets

#sd <- SharedData$new(quakes[sample(nrow(quakes), 100),])
#sd <- SharedData$new(quakes)
dataset <- pvsites %>% dplyr::select(Name=POINTNAME, Longitude=LON, Latitude=LAT)
sd <- SharedData$new(dataset)
#pvsites<- read.csv("./data/mainewaypoints2.csv")
#sd <- SharedData$new(data/pvsites)


ui <- fluidPage(
  # Create a filter input
 # filter_slider("mag", "Magnitude", sd, column=~mag, step=0.1, width=250),
  #filter_slider("BAYNUM", "Bay", sd, column=~BAYNUM, step=0.1, width=250),

  bscols(leafletOutput("map"), DTOutput("table"))
)


server <- function(input,output) {
 # sd <- SharedData$new(quakes[sample(nrow(quakes), 100),]) 
 # sd <- SharedData$new(data/pvsites[sample(nrow(data/pvsites), 100),])
  output$map <- renderLeaflet({ leaflet(sd) %>% addTiles() %>% addCircleMarkers(stroke = FALSE, fillOpacity = 2, radius = 4 )})
 

  
  
  
  
   
  output$table <- renderDT({
    datatable(sd, extensions="Scroller", style="bootstrap", class="compact", width="100%",
              options=list(deferRender=TRUE, scrollY=300, scroller=TRUE))
  }, server = FALSE)
}

shinyApp(ui = ui, server = server)