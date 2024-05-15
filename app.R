source('./scripts/global.R', local = TRUE)$value

ui <- dashboardPage(
  dashboardHeader(title = "Pinniped Distribution Query Tool", titleWidth = 350),
  ## Sidebar content
  dashboardSidebar(
    sidebarMenu(
      menuItem("General Information", tabName = "readme"),
     # menuItem("Haulout Tables", tabName = "haulouttables"),
      menuItem("Map of Haulout Sites", tabName = "hauloutmap")
      ,
      menuItem("Gray Seal Pupping Data", tabName = "rectsel")
      ,
      menuItem("Harbor Seal Pupping Data", tabName = "Pvrectsel")
      #,
      #menuItem("Maine Bay Units with Graphs", tabName = "baylines")
     ,
   menuItem("2014/2015 Cape Cod Counts", tabName = "counts1415")
    #  menuItem("Expando Tables", tabName = "expando")
    #  ,
    #  menuItem("Rectangle select tab version", tabName = "rectselect")
     )
  ),
  ## Body content
  dashboardBody(
    tabItems(
      # # First tab content
      tabItem(tabName = "readme",
              source('./scripts/readme3_ui.R', local = TRUE)$value
      )
      ,
      # # First tab content
      tabItem(tabName = "haulouttables",
              source('./scripts/haulouttables_ui.R', local = TRUE)$value
      )
      ,
      # # # Second tab content
      tabItem(tabName = "rectsel",
              source('./scripts/rectangleSelectExample3.R', local = TRUE)$value
      )  
      ,
      # # # Second tab content
      tabItem(tabName = "Pvrectsel",
              source('./scripts/rectangleSelectPv2.R', local = TRUE)$value
      )  
      ,
      # # # third tab content
      tabItem(tabName = "hauloutmap",
              source('./scripts/hauloutmap2_ui.R', local = TRUE)$value, h4("Green markers depict sites surveyed by the NEFSC or University of Maine where adults of the species were seen, red markers are where pups were seen.")
      ) 
      ,
      # # # another tab content
      tabItem(tabName = "bays",
             source('./scripts/baysMap.R', local = TRUE)$value, h1("text to be displayed")
      ) 
      ,
      # # # another tab content
     # tabItem(tabName = "baylines",
      #        source('./scripts/baysWithLineGraph.R', local = TRUE)$value, h4("The Northeast Fisheries Science Center has been conducting aerial surveys of harbor seals since 1983 to monitor the abundance of the population in U.S. waters. Surveys are flown during the pupping season when animals are concentrated on the coast of Maine and timed to coincide with peak pupping estimated to be around the end of May. Surveys are flown from a NOAA Twin Otter at 230m within 2 hours of low tide using a hand-held Canon camera and fixed 300mm lens. Close to 1,000 ledges are surveyed and grouped into bay units for analysis. This map displays the estimated abundance in the form of bar charts of both pups and non-pups by bay unit each year from 1983-2018. For more information, see Sigourney et al. 2020. https://onlinelibrary.wiley.com/doi/full/10.1111/mms.12873")
     # ) 
     # ,
      # # # another tab content
     # tabItem(tabName = "expando",
      #        source('./scripts/PupExpand_ui.R', local = TRUE)$value
     # )
      #,
      # # # another tab content
      tabItem(tabName = "counts1415",
              source('./scripts/counts1415.R', local = TRUE)$value, h4("In 2014 and 2015, the Northeast Fisheries Science Center and the Center for Coastal Studies conducted monthly surveys of gray and harbor seals at roughly 30 haul-out sites in southeastern Massachusetts. Aerial surveys were flown monthly in a Skymaster aircraft at an altitude of approximately 230m on days with good visibility and within 2 hours of low tide, using a hand-held Canon 7D camera and fixed 300mm lens. This map displays the minimum counts and relative composition in the form of pie charts of both species by month throughout each year. This effort represents the only year-round survey conducted of seals in this region. For more information, see Pace et al, 2019.
Note that Muskeget Island ....    Drag the round handle of the time slider in the lower right, or animate by clicking on the time slider arrowhead.")     
      )
    #  ) 
      )  
    )
  )



server = function(input, output, session) {
  ## readmeOutput
  source('./scripts/readme3_server.R', local = TRUE)$value
  ## haulouttables Output
  source('./scripts/haulouttables_server.R', local = TRUE)$value
  ## hauloutmap Output
  source('./scripts/hauloutmap2_server.R', local = TRUE)$value
  ## Expando Output Output
 # source('./scripts/PupExpand_server.R', local = TRUE)$value
#  source('./scripts/RectSelect_server.R', local = TRUE)$value
  ## taglookup2 Output
 # source('./scripts/taglookup2_server.R', local = TRUE)$value
}

shinyApp(ui, server)
