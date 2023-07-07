#R code
library(dplyr)
library(leaflet) 
library(DT)
library(crosstalk)

data_2 <- data.frame(ID=c(1:8),
                     Name1 = c("A", "A", "A", "C", "B", "B", "A", "B"),
                     Name2 = c("a", "b", "b", "a", "b", "a", "b", "c"),
                     Value1 = c(12,43,54,34,23,77,44,22),
                     Value2 = c(6,5,2,7,5,6,4,3),
                     Lat = c(51.1, 51.6, 57.3, 52.4, 56.3, 54.3, 60.4, 49.2),
                     Lon = c(5, -3, -2, -1, 4, 3, -5, 0))

data_2<-data_2 %>%
  mutate(
    lab_DB = case_when(
      Name1 == unique(data_2$Name1)[1]  ~ "blue",
      Name1 == unique(data_2$Name1)[2]  ~ "green",
      Name1 == unique(data_2$Name1)[3]  ~  "red"
      
    )
  )


sdf <- SharedData$new(data_2, ~data_2$ID)
DT1<-datatable(
  sdf,  filter = 'top',
  extensions =  c('Select', 'Buttons'),   selection = 'none', options = list(select = list(style = 'os', items = 'row'),dom = 'Bfrtip',autoWidth = TRUE,buttons =  list('copy' ,
                                                                                                                                                                        list(extend = 'collection',  buttons = c('csv', 'excel', 'pdf', 'print'),
                                                                                                                                                                             text = 'Download')
                                                                                                                                                                        ,list(extend = 'collection', text = 'Mean',
                                                                                                                                                                              action = DT::JS("function ( e, dt, node, config ) {
                                                                        let columnData = dt.column(4,{search:'applied'}).data().toArray();
                                                                         var amean= Math.round(columnData.reduce((sum, item) => sum+=item)/columnData.length);
                                                                         alert('mean Value1: ' +amean); 
                                                                                       }"))
                                                                                                                                                                        ,list(extend='collection',buttons=c('selectAll', 'selectNone', 'selectRows', 'selectColumns', 'selectCells'),text='sel')
                                                                                                                                                                        
                                                                                                                                                                        
  )))
ltlf5<- leaflet(sdf) %>% 
  #addProviderTiles(providers$CartoDB.Positron) %>%
  addTiles() %>%
  addCircleMarkers(
    lng = ~Lat,
    lat = ~Lon,
    group = ~Name1,popup = ~paste(Name1, '   <br/>  ',
                                  Name2,'   <br/>  ' ),
    color =~lab_DB ,
    radius = 3
    
  )   %>%
  addLayersControl(
    overlayGroups = c('A','B','C')
    ,options = layersControlOptions(collapsed = FALSE)
  ) %>%
  addLegend(
    position = 'bottomleft',
    labels = c('Group A','Group B','Group C'),
    colors = c("blue","red", "green"),
    title = "Group color"
  ) 


bscols(ltlf5 ,DT1)  