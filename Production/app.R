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
    tabItems(
     # # # tab content
     tabItem(tabName = "counts20142015",
             source('./scripts/counts20142015.R', local = TRUE)$value     
     )
    
      )  
    )
  )



server = function(input, output, session) {

}

shinyApp(ui, server)
