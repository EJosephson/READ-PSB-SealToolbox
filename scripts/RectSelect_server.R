
tilesURL <- "http://server.arcgisonline.com/ArcGIS/rest/services/Canvas/World_Light_Gray_Base/MapServer/tile/{z}/{y}/{x}"


#sdf <- SharedData$new(pupsites, ~pupsites$HAULOUTSITECODE)

####

## read in data
data_2x <- read.csv("./data/GraySealHaulouts.csv")

data3x <- read.csv("./data/HgPupsYearandSite.csv")
data3x$Site[data3x$Site=="Monomoy"]<-"Monomoy Island"
data3x$Site[data3x$Site=="Muskeget"]<-"Muskeget Island"
data3x$Site[data3x$Site=="Nomans"]<-"Nomans Island"
data3x$Pups[data3x$Pups=="not surveyed"]<-""
data3x <- data3x %>% dplyr::rename("HAULOUTSITE" = "Site")

pupsitesx <- data_2x %>% filter(HAULOUTSITE %in% c("Muskeget Island", "Monomoy Island", "Seal Island", "Wooden Ball", "Green Island", "Nomans Island"))

# set up a group of SharedData objects
shared_sitesx <- SharedData$new(pupsitesx, key = ~HAULOUTSITE, group = "shared_obj")
shared_ctsx <- SharedData$new(data3x, key = ~HAULOUTSITE, group = "shared_obj")
####



output$my_table3 <- DT::renderDataTable({
datatable(
  shared_ctsx,  filter = 'top',
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
}) 

output$mymap3 <- renderLeaflet({
leaflet(shared_sitesx) %>% 
  addTiles(tilesURL) %>%

  addCircleMarkers(
    lng = ~LON,
    lat = ~LAT,
    group = ~HAULOUTSITECODE,popup = ~paste(HAULOUTSITE, '   <br/>  ',
                                        HAULOUTAREA,'   <br/>  ' ),
    radius = 3
    
  )   

})
#bscols(ltlf5 ,DT1) 






