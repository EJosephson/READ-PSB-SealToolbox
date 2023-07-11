#server <- function(input, output) {
  output$my_table <- DT::renderDataTable({
    ### 
    ## read in data
    data3 <- read.csv("./data/HgPupsYearandSite.csv")
    
    
    
    
    datatable(
      data3, filter = 'top',
      extensions = 'RowGroup',
      options = list(rowGroup = list(dataSrc = 1), pageLength = 20),
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
  
  output$my_table2 <- DT::renderDataTable({
    ### 
    ## read in data
    data4<-read_csv("./data/Seal Abundance by Bay Unit 1993-2018 (1).csv")
    
    
    
    
    datatable(
      data4[order(data4$Bayunit), ], filter = 'top',
      extensions = 'RowGroup',
      options = list(rowGroup = list(dataSrc = 2), pageLength = 20),
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
  
 
#}

# Run the application
#shinyApp(ui = ui, server = server)