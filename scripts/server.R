
server <- function(input, output, session) {

  points <- eventReactive(input$map, {
    

    # open file
    TNASS07<-read.csv("//net/mmi/share/SAR/maps/TNASS2007sight.csv",head=TRUE,sep=",");
    TNASS07 %>% filter(Species.Name == input$birdsp)  %>%
      dplyr::select(Species.Name, Longitude, Latitude)
    
  #  nova <- odbcConnect("nova", uid="xxxx", pwd="xxxx",believeNRows=FALSE)
#    q<-paste("select lon, lat from birdsightexport3 where species = \'",input$birdsp,"\'", sep="")
 # sp<-sqlQuery(nova, q)
#    data.frame(sp, stringsAsFactors = FALSE)

  }, ignoreNULL = FALSE)
  
  output$mymap <- renderLeaflet({
    leaflet() %>%
      addProviderTiles(providers$Esri.WorldImagery,
                       options = providerTileOptions(noWrap = TRUE)
      ) %>%
      addCircleMarkers(data = points(),stroke = FALSE, fillOpacity = 2, radius = 4)
  })


# Downloadable csv of selected dataset ----
output$downloadData <- downloadHandler(
   filename = function() {
     paste(input$birdsp, ".csv", sep = "")
   }#,
  # content = function(file) {
  #   write.csv(datasetInput(), file, row.names = FALSE)
  # }
)
}