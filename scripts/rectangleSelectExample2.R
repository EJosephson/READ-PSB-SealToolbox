library(dplyr)
library(leaflet) 
library(DT)
library(crosstalk)

## read in data
#data_2 <- read.csv("./data/GraySealHaulouts.csv")

#data3 <- read.csv("./data/HgPupsYearandSite.csv")
#data3$Site[data3$Site=="Monomoy"]<-"Monomoy Island"
#data3$Site[data3$Site=="Muskeget"]<-"Muskeget Island"
#data3$Site[data3$Site=="Nomans"]<-"Nomans Island"
#data3$Pups[data3$Pups=="not surveyed"]<-""

#pupsites<- merge(data3, data_2, by.x="Site", by.y="HAULOUTSITE")
#pupsites <- data_2 %>% filter(HAULOUTSITE %in% c("Muskeget Island", "Monomoy Island", "Seal Island", "Wooden Ball", "Green Island", "Nomans Island"))

tilesURL <- "http://server.arcgisonline.com/ArcGIS/rest/services/Canvas/World_Light_Gray_Base/MapServer/tile/{z}/{y}/{x}"


#sdf <- SharedData$new(pupsites, ~pupsites$HAULOUTSITECODE)

####

## read in data
data_2 <- read.csv("./data/GraySealHaulouts.csv")

data3 <- read.csv("./data/HgPupsYearandSite.csv")
data3$Site[data3$Site=="Monomoy"]<-"Monomoy Island"
data3$Site[data3$Site=="Muskeget"]<-"Muskeget Island"
data3$Site[data3$Site=="Nomans"]<-"Nomans Island"
data3$Pups[data3$Pups=="not surveyed"]<-""
data3 <- data3 %>% dplyr::rename("HAULOUTSITE" = "Site")

pupsites <- data_2 %>% filter(HAULOUTSITE %in% c("Muskeget Island", "Monomoy Island", "Seal Island", "Wooden Ball", "Green Island", "Nomans Island"))

# set up a group of SharedData objects
shared_sites <- SharedData$new(pupsites, key = ~HAULOUTSITE, group = "shared_obj")
shared_cts <- SharedData$new(data3, key = ~HAULOUTSITE, group = "shared_obj")
####




DT1<-datatable(
  shared_cts,  filter = 'top',
  extensions =  c('Select', 'Buttons', 'RowGroup'),   options = list(rowGroup = list(dataSrc = 1), select = list(style = 'os', items = 'row'),dom = 'Bfrtip',autoWidth = TRUE,buttons =  list(list(extend = 'collection',  buttons = c('csv', 'excel', 'pdf', 'print'), text = 'Download')
  )),
# )

#  extensions = 'RowGroup',
 # options = list(rowGroup = list(dataSrc = 1), pageLength = 20),
  callback = JS(
    "table.on('click', 'tr.dtrg-group', function () {",
    "  var rowsCollapse = $(this).nextUntil('.dtrg-group');",
    "  $(rowsCollapse).toggleClass('hidden');",
    "});",
    "table.one('init', () => $('#my_table .dtrg-group').trigger('click'))"
  ),
  selection = 'none'
)  
  
ltlf5<- leaflet(shared_sites) %>% 
  addTiles(tilesURL) %>%

  addCircleMarkers(
    lng = ~LON,
    lat = ~LAT,
    group = ~HAULOUTSITECODE,popup = ~paste(HAULOUTSITE, '   <br/>  ',
                                        HAULOUTAREA,'   <br/>  ' ),
    radius = 3
    
  )   


bscols(ltlf5 ,DT1) 






