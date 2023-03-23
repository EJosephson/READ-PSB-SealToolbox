
#load some libraries
library(leaflet)
library(leafpop)
library(dplyr)
library(leaflet.minicharts)
library(lubridate)


######################




counts1415<-read.csv("data/countsummary20142015.csv")


counts1415$SURVEYDATE <- mdy(counts1415$SURVEYDATE) - days(1)


tilesURL <- "http://server.arcgisonline.com/ArcGIS/rest/services/Canvas/World_Light_Gray_Base/MapServer/tile/{z}/{y}/{x}"

basemap <- leaflet(width = "100%", height = "400px") %>%
  addTiles(tilesURL) 

colors <- c("#3093e5", "#fcba50")
basemap %>%
  addMinicharts(
    counts1415$LON, counts1415$LAT,
    chartdata = counts1415[, c("HG", "PV")],
    type = "pie",
    time = counts1415$SURVEYDATE,
    colorPalette = colors,
    width = 60 * sqrt(counts1415$TOTALSEALS) / sqrt(max(counts1415$TOTALSEALS)), transitionTime = 0
  )
