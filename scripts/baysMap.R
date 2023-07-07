#load some libraries
library(rgdal)
library(leaflet)
library(leafpop)


bays<-st_read("./data/BayPolys.shp")


baynames<-read.csv("./data/MaineBayUnits.csv")


### add data 

bays2 <- merge(bays, baynames, by.x="BAYNUM", by.y="BAYNUM")

leaflet(bays2) %>%
  
  addProviderTiles(providers$Esri.WorldImagery,
                   options = providerTileOptions(noWrap = TRUE)
  ) %>%
  addPolygons(color = "#444444", weight = 1, smoothFactor = 0.5,
              opacity = 1.0, fillOpacity = 0.5,
              label = ~paste(BAYDESC, sep=" "),
              # popup = popupTable(bays),
              fillColor = ~colorQuantile("YlOrRd", BAYNUM)(BAYNUM),
              highlightOptions = highlightOptions(color = "white", weight = 2,
                                                  bringToFront = TRUE))
