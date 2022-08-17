Sys.setenv(ORACLE_HOME="/ora1/app/oracle/product/11.2.0/dbhome_1")
source('./scripts/global.R', local = TRUE)$value

ui <- dashboardPage(
  dashboardHeader(title = "Seal Toolbox"),
  ## Sidebar content
  dashboardSidebar(
    sidebarMenu(
      menuItem("Haulout Tables", tabName = "haulouttables"),
      menuItem("Map of Haulout Sites", tabName = "hauloutmap")
      #menuItem("Tag Lookup", tabName = "taglookup")
     # ,
     # menuItem("Tag Lookup2", tabName = "taglookup2")
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
      #tabItem(tabName = "taglookup",
      #        source('./scripts/taglookup_ui.R', local = TRUE)$value
     # )  
      #,
      # # # third tab content
      tabItem(tabName = "hauloutmap",
              source('./scripts/hauloutmap_ui.R', local = TRUE)$value
      ) 
    #  ,
      # # # another tab content
      #tabItem(tabName = "taglookup2",
     #        source('./scripts/taglookup2_ui.R', local = TRUE)$value
     # ) 
      )  
    )
  )



server = function(input, output, session) {
  ## haulouttables Output
  source('./scripts/haulouttables_server.R', local = TRUE)$value
  ## hauloutmap Output
  source('./scripts/hauloutmap_server.R', local = TRUE)$value
  ## taglookup Output
  #source('./scripts/taglookup_server.R', local = TRUE)$value
  ## taglookup2 Output
 # source('./scripts/taglookup2_server.R', local = TRUE)$value
}

shinyApp(ui, server)