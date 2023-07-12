#R code
library(dplyr)
library(leaflet) 
library(DT)
library(crosstalk)

## read in data
data_2 <- read.csv("./data/GraySealHaulouts.csv")


pupsites <- data_2 %>% filter(HAULOUTSITE %in% c("Muskeget Island", "Monomoy Island", "Seal Island", "Wooden Ball", "Green Island", "Nomans Island"))
tilesURL <- "http://server.arcgisonline.com/ArcGIS/rest/services/Canvas/World_Light_Gray_Base/MapServer/tile/{z}/{y}/{x}"



sdf <- SharedData$new(pupsites, ~pupsites$HAULOUTSITECODE)
DT1<-datatable(
  sdf,  filter = 'top',
  extensions =  c('Select', 'Buttons'),   selection = 'none', options = list(select = list(style = 'os', items = 'row'),dom = 'Bfrtip',autoWidth = TRUE,buttons =  list(list(extend = 'collection',  buttons = c('csv', 'excel', 'pdf', 'print'), text = 'Download')
  )))
ltlf5<- leaflet(sdf) %>% 
  #addProviderTiles(providers$CartoDB.Positron) %>%
  addTiles(tilesURL) %>%
  addCircleMarkers(
    lng = ~LON,
    lat = ~LAT,
    group = ~HAULOUTSITE,popup = ~paste(HAULOUTSITE, '   <br/>  ',
                                        HAULOUTAREA,'   <br/>  ' ),
    radius = 3
    
  )   


bscols(ltlf5 ,DT1)  