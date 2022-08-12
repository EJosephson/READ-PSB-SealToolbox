
#

birdTable <- eventReactive(input$yes, {


#hghaulouts<- read.csv("//net/shiny1/AMAPPS/toolboxTest1/data/GraySealHaulouts.csv")
hghaulouts<- read.csv("./data/GraySealHaulouts.csv")
#mainebays<- read.csv("//net/shiny1/AMAPPS/toolboxTest1/data/MaineBayUnits.csv")
mainebays<- read.csv("./data/MaineBayUnits.csv")
#pvsites<- read.csv("//net/shiny1/AMAPPS/toolboxTest1/data/mainewaypoints2.csv")
pvsites<- read.csv("./data/mainewaypoints2.csv")

  if (input$dset == "MAINEBAYUNITS"){
    dataset <- mainebays
  }
  else if (input$dset == "HAULOUTS"){
    dataset <- hghaulouts
  }
  else if (input$dset == "MAINEWAYPOINTS2"){
    dataset <- pvsites
  }
  return(dataset)
})

# 
# #filter data based on selections
output$birdTable<- DT::renderDataTable(DT::datatable({
  
  birdTable() 
  
}))


#
#


