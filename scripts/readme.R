###readme,

fluidPage(
  
  # App title ----
  titlePanel(tagList(img(src = 'Gray-seal-2.png', height="12%", width="12%", align = "left"),img(src = 'noaanefsclogo.PNG'),img(src = 'Harbor-seal-2.png', height="12%", width="12%"),br(),title='NEFSC Protected Species Division Pinniped Research'),
             tags$head(tags$link(rel = "icon", type = "image/png", href = "favicon.png")
             )
  ),
  mainPanel(img(src = 'sealsonlongbar.png', height="100%", width="100%", align = "center"), h4(style="text-align: justify;","The Northeast Fisheries Science Center (NEFSC) has been conducting aerial surveys of gray and harbor seals for several decades to monitor the abundance and distribution of both populations in U.S. waters. The Pinniped Distribution Query Tool provides an interactive platform for users to query and download results of these surveys. More details about the surveys can be found in the accompanying text and literature cited in each section found in the left hand table of contents. This tool was developed by staff at Northeast Fisheries Science Center, Protected Species Division, and was funded by the NOAA Office of Science and Technology. Contents are packaged within <add GITHUB repo address?>" )
))
