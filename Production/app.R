source('./scripts/global.R', local = TRUE)$value

ui <- dashboardPage(
  dashboardHeader(title = "Pinniped Distribution Query Tool", titleWidth = 350),
  ## Sidebar content
  dashboardSidebar(
    sidebarMenu(
      menuItem("General Information", tabName = "readme")
       ,
       menuItem("Map of Haulout Sites", tabName = "hauloutmap")
       ,
       menuItem("Gray Seal Pupping Data", tabName = "rectsel")
       ,
       menuItem("Harbor Seal Pupping Data", tabName = "Pvrectsel")
       ,
       menuItem("2014/2015 Cape Cod Counts", tabName = "counts1415")
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
#       # # # Second tab content
       tabItem(tabName = "rectsel",
               source('./scripts/rectangleSelectHg.R', local = TRUE)$value
       )  
       ,
#       # # # Second tab content
      tabItem(tabName = "Pvrectsel",
               source('./scripts/rectangleSelectPv2.R', local = TRUE)$value
       )  
       ,
#       # # # third tab content
       tabItem(tabName = "hauloutmap",
               source('./scripts/hauloutmap2_ui.R', local = TRUE)$value, h4("Green markers depict sites surveyed by the NEFSC or University of Maine where adults of the species were seen, red markers are where pups were seen.")
       ) 
       ,
#       # # # another tab content
       tabItem(tabName = "counts1415",
               source('./scripts/counts1415.R', local = TRUE)$value, h4("In 2014 and 2015, the", tags$a(href="https://www.fisheries.noaa.gov/about/northeast-fisheries-science-center", target="_blank", rel="noopener noreferrer", "Northeast Fisheries Science Center"), "and the", tags$a(href="https://coastalstudies.org/", target="_blank", rel="noopener noreferrer", "Center for Coastal Studies"), "conducted monthly surveys of gray and harbor seals at roughly 30 haul-out sites in southeastern Massachusetts. Aerial surveys were flown monthly in a Skymaster aircraft at an altitude of approximately 230m on days with good visibility and within 2 hours of low tide, using a hand-held Canon 7D camera and fixed 300mm lens. This map displays the minimum counts and relative composition in the form of pie charts of both species by month throughout each year. This effort represents the only year-round survey conducted of seals in this region. For more information, see", tags$a(href="https://repository.library.noaa.gov/view/noaa/22053",  target="_blank", rel="noopener noreferrer","Pace et al. 2019"),".
 Note that Muskeget Island is not included here because full surveys were not conducted during the pupping season as part of this project.    Drag the round handle of the time slider in the lower right, or animate by clicking on the time slider arrowhead.")     
       )
    )  
  )
)



server = function(input, output, session) {
  ## readmeOutput
  source('./scripts/readme3_server.R', local = TRUE)$value
  ## hauloutmap Output
  source('./scripts/hauloutmap2_server.R', local = TRUE)$value
}

shinyApp(ui, server)
