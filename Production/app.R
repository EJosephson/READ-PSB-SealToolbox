source('global.R', local = TRUE)$value

ui <- dashboardPage(
  dashboardHeader(title = "Pinniped Distribution Query Tool", titleWidth = 450),
  ## Sidebar content
  dashboardSidebar(
    width = 280,
    sidebarMenu(

      menuItem("2014/2015 monthly Cape Cod Counts", tabName = "counts20142015")

     )
  ),
  ## Body content
  dashboardBody(
    fluidRow(
      column(10, offset = 1,
    tabItems(
     # # # tab content
     tabItem(tabName = "counts20142015",
             source('./scripts/counts20142015.R', local = TRUE)$value     
     )
    
      )  
  ),
  fluidRow(
    column(10, offset = 1,
   h4("In 2014 and 2015, the Northeast Fisheries Science Center and the Center for Coastal Studies conducted monthly surveys of gray and harbor seals at roughly 30 haul-out sites in southeastern Massachusetts. Aerial surveys were flown monthly in a Skymaster aircraft at an altitude of approximately 230m on days with good visibility and within 2 hours of low tide, using a hand-held Canon 7D camera and fixed 300mm lens. This map displays the minimum counts and relative composition in the form of pie charts of both species by month throughout each year, aggregated over X sites. This effort represents the only year-round survey conducted of seals in this region.")
  ,)
  )
    )
    )
  )



server = function(input, output, session) {

}

shinyApp(ui, server)
