

server <- function(input, output, session) {

points <- eventReactive(input$map, {
    
    
    # open file
    # TNASS07<-read.csv("//net/mmi/share/SAR/maps/TNASS2007sight.csv",head=TRUE,sep=",");
    #  TNASS07 %>% filter(Species.Name == input$birdsp)  %>%
    #  dplyr::select(Species.Name, Longitude, Latitude)
    
    hghaulouts<- read.csv("data/GraySealHaulouts.csv")
    mainebays<- read.csv("data/MaineBayUnits.csv")
    pvsites<- read.csv("data/mainewaypoints2.csv")
    
    if (input$mset == "MAINEBAYUNITS"){
        dataset <- mainebays 
    }
    else if (input$mset == "HAULOUTS"){
        dataset <- hghaulouts %>% dplyr::select(Name=HAULOUTSITE, Longitude=LON, Latitude=LAT)
    }
    else if (input$mset == "MAINEWAYPOINTS2"){
        dataset <- pvsites %>% dplyr::select(Name=POINTNAME, Longitude=LON, Latitude=LAT)
    }
    
    return(dataset)
    
    
}, ignoreNULL = FALSE)

output$mymap <- renderLeaflet({
    leaflet() %>%
        addProviderTiles(providers$Esri.WorldImagery,
                         options = providerTileOptions(noWrap = TRUE)
        ) %>%
        addCircleMarkers(data = points(), label = ~as.character(Name), stroke = FALSE, fillOpacity = 2, radius = 4 )
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