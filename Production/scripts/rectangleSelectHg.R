library(dplyr)
library(leaflet) 
library(DT)
library(crosstalk)
library(shinydashboard)


dashboardSidebar(disable = TRUE)


####

# ## read in data
   #data2 <- read.csv("./data/GraySealHaulouts.csv")
  # data2<- select(data2, Site=HAULOUTSITE, LAT, LON)
   sites <- read.csv("./data/HgPupsYearandSite2.csv")
  # data3$Site[data3$Site=="Monomoy"]<-"Monomoy Island"
  # data3$Site[data3$Site=="Muskeget"]<-"Muskeget Island"
  # data3$Site[data3$Site=="Nomans"]<-"Nomans Island"
  # data2$Site[data2$Site=="Great Point Nantucket"]<-"Great Point"
  # sites$Site <- as.factor(sites$Site)
  # sites<-merge(data3, data2, by ="Site", all.x=TRUE)
 # 
 # # Wrap data frame in SharedData
#  share <- SharedData$new(sites)

# 
#  DT2<-datatable(
#    share,filter = list(
#      position = 'top', clear = FALSE
#    ),
#    extensions =  c('Select', 'Buttons'),   options = list(select = list(style = 'os', items = 'row'),dom = 'Bfrtip',columnDefs = list(list(className = 'dt-center', targets = 1:3)), autoWidth = TRUE, include.rownames= FALSE, buttons =  list(list(extend = 'collection',  buttons = c('csv', 'excel', 'pdf', 'print'), text = 'Download')
#    )),
#  )  
#   
#  ltlf2<- leaflet(share) %>% 
#    addProviderTiles(providers$Esri.WorldImagery) %>%
#    addCircleMarkers(
#      lng = ~LON,
#      lat = ~LAT,
#      radius = 3,
#      color = 'yellow'
#      
#    )   
# 
# 
# 
# #mainPanel(width = 10,
 body <-  dashboardBody( tags$head(tags$style(HTML('
 .box {margin-top: 2px;margin-left: 0px; margin-right: 0px; margin-bottom:2px;padding:0px}'
 ))),
   fluidRow(
#     # App title ----
     titlePanel(tagList(img(src = 'noaanefsclogo.PNG'),br(),title='Gray Seal Pupping Data'),
                tags$head(tags$link(rel = "icon", type = "image/png", href = "favicon.png")
                )
     ),
   )
  ,
#    fluidRow(
# 
#      column(6,ltlf2, h4(style="text-align: justify;","The NEFSC has been conducting aerial surveys of gray seal pupping colonies since 2005 to monitor the number of pups born in U.S. waters. 
#                         Surveys were flown from either a Cessna 252, Cessna Skymaster, or NOAA Twin Otter at altitudes ranging from 180-230 m, 
#                         using hand-held or belly-mounted Canon camera systems. Ideally, surveys are flown after all pups are born and before they start leaving the colony, 
#                         but in some years surveys may have been flown before or after this optimal window. Furthermore, not all colonies may have been surveyed each year 
#                         due to logistics or if the site was not yet an established pupping colony. This map represents the minimum count of pups born on each colony from 2005-2021, 
#                         and if multiple flights were flown in a season, the maximum count of replicate surveys. For more information, see Wood et al.", tags$a(href="https://academic.oup.com/jmammal/article/101/1/121/56750962020", "2020,"), tags$a(href="https://repository.library.noaa.gov/view/noaa/46455", "2022.")), 
#                         h4("Use the bracket tool in the corner of this map and drag the corners to select rookeries (blue dots) of interest. 
#                         Or just use the filters in the datatable at left to select data."))
#    ,
# #    
# #     
#    column(6,DT2),  p(style="text-align: justify;","* indicates site not surveyed; ** indicates the counts were removed due to poor image quality/coverage, *** indicates the counts were removed due to survey date.")
#   )
# 
 )
# 
