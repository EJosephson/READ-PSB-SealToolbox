source('./scripts/global.R', local = TRUE)$value

ui <- dashboardPage(
  dashboardHeader(title = "Pinniped Distribution Query Tool", titleWidth = 450),
  ## Sidebar content
  dashboardSidebar(
    sidebarMenu(
      menuItem("Haulout Tables", tabName = "haulouttables"),
      menuItem("Map of Haulout Sites", tabName = "hauloutmap")
      ,
      menuItem("Select example", tabName = "rectsel")
      ,
      menuItem("Maine Bay Units", tabName = "bays")
      ,
      menuItem("Maine Bay Units with Line Graphs", tabName = "baylines")
      ,
      menuItem("Expando Tables", tabName = "expando")
     )
  ),
  ## Body content
  dashboardBody(
    tabItems(
      # # First tab content
      tabItem(tabName = "haulouttables",
              source('./scripts/haulouttables_ui.R', local = TRUE)$value
      )
      ,
      # # # Second tab content
      tabItem(tabName = "rectsel",
              source('./scripts/rectangleSelectExample.R', local = TRUE)$value
      )  
      ,
      # # # third tab content
      tabItem(tabName = "hauloutmap",
              source('./scripts/hauloutmap_ui.R', local = TRUE)$value
      ) 
      ,
      # # # another tab content
      tabItem(tabName = "bays",
             source('./scripts/baysMap.R', local = TRUE)$value
      ) 
      ,
      # # # another tab content
      tabItem(tabName = "baylines",
              source('./scripts/baysWithLineGraph.R', local = TRUE)$value
      ) 
      ,
      # # # another tab content
      tabItem(tabName = "expando",
              source('./scripts/PupExpand_ui.R', local = TRUE)$value
      )
      )  
    )
  )



server = function(input, output, session) {
  ## haulouttables Output
  source('./scripts/haulouttables_server.R', local = TRUE)$value
  ## hauloutmap Output
  source('./scripts/hauloutmap_server.R', local = TRUE)$value
  ## Expando Output Output
  source('./scripts/PupExpand_server.R', local = TRUE)$value
  ## taglookup2 Output
 # source('./scripts/taglookup2_server.R', local = TRUE)$value
}

shinyApp(ui, server)
