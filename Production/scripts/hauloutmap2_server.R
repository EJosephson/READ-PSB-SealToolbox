

#server <- function(input, output, session) {

#  points <- eventReactive(input$map, {
points <- eventReactive(input$mset, {   
  
  # open file
  # TNASS07<-read.csv("//net/mmi/share/SAR/maps/TNASS2007sight.csv",head=TRUE,sep=",");
  #  TNASS07 %>% filter(Species.Name == input$birdsp)  %>%
  #  dplyr::select(Species.Name, Longitude, Latitude)
  
  allseals<- read.csv("./data/AllHaulouts.csv")
  #mainebays<- read.csv("//net/shiny1/AMAPPS/toolboxTest1/data/MaineBayUnits.csv")
#  mainebays<- read.csv("./data/MaineBayUnits.csv")
  #pvsites<- read.csv("//net/shiny1/AMAPPS/toolboxTest1/data/mainewaypoints2.csv")
 # pvsites<- read.csv("./data/mainewaypoints2.csv")
  
  if (input$mset == "Hg"){
    dataset <- allseals %>% dplyr::filter(Hg=="Y" | HgPupSurveySite=="Y") %>% dplyr::select(Name=POINTNAME, Longitude=LON, Latitude=LAT, Pup=HgPupSurveySite)
  }
  else if (input$mset == "Pv"){
    dataset <- allseals %>% dplyr::filter(Pv=="Y" | PvPupSurveySite=="Y") %>% dplyr::select(Name=POINTNAME, Longitude=LON, Latitude=LAT, Pup=PvPupSurveySite)
  }

  
  return(dataset)
  
  
}, ignoreNULL = FALSE)



output$mymap <- renderLeaflet({
  leaflet() %>%
    addProviderTiles(providers$Esri.WorldImagery,
                     options = providerTileOptions(noWrap = TRUE)
    ) %>%
    addCircleMarkers(data = points(), label = ~paste(Name), stroke = FALSE, fillOpacity = 2, radius = 4, color = ~ ifelse(Pup == "Y", "purple", "orange"))
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
#}

