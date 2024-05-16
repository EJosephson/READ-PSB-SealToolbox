###readme,


ui<-
  fluidPage(
    
    # App title ----
    titlePanel(tagList(img(src = 'Gray-seal-2.png', height="12%", width="12%", align = "left"),img(src = 'noaanefsclogo.PNG'),img(src = 'Harbor-seal-2.png', height="12%", width="12%"),br(),title='NEFSC Protected Species Division Pinniped Research'),
               tags$head(tags$link(rel = "icon", type = "image/png", href = "favicon.png")
               )
    ),
    #DDtable<-read.csv("data/DataDesc.csv"),
    mainPanel(img(src = 'sealsonlongbar.png', height="100%", width="100%", align = "center"), h4(style="text-align: justify;",tags$a(href="https://www.fisheries.noaa.gov/about/northeast-fisheries-science-center","The Northeast Fisheries Science Center (NEFSC)"), "and its partners have been conducting aerial surveys of gray and harbor seals for several decades to monitor the abundance and distribution of both populations in U.S. waters. The Pinniped Distribution Query Tool provides an interactive platform for users to query and download results of these surveys. More details about the surveys can be found in the accompanying text and literature cited in each section found in the left hand table of contents. This tool was developed by staff at the", tags$a(href="https://www.fisheries.noaa.gov/new-england-mid-atlantic/about-us/protected-species-research-northeast", "Northeast Fisheries Science Center, Protected Species Division"), "and was funded by the", tags$a(href="https://www.fisheries.noaa.gov/about/office-science-and-technology", "NOAA Office of Science and Technology"), ". Contents are packaged within", tags$a(href="https://github.com/NEFSC/READ-PSB-SealToolbox/tree/main/Production", "this GitHub repository.")
                                                                                                 , tableOutput('tbl') , h5("References"), tags$a(href="https://onlinelibrary.wiley.com/doi/abs/10.1111/j.1748-7692.2005.tb01246.x", "Gilbert, JR, Waring, GT, Wynne, KM, Guldager, N (2005). Changes in abundance of harbor seals in Maine, 1981-2001. Marine Mammal Science, 21(3), 519-535."), br(),                                                                                      
                                                                                                 tags$a(href="https://repository.library.noaa.gov/view/noaa/22053", "Pace, RM, Josephson, E, Wood, SA, Murray, K, Waring, G (2019). Trends and patterns of seal abundance at haul-out sites in a gray seal recolonization zone.  NOAA Technical Memorandum NMFS-NE-251. 23 p."), br(),
                                                                                                 tags$a(href="https://www.google.com/url?sa=t&rct=j&q=&esrc=s&source=web&cd=&ved=2ahUKEwj-wI-a77KDAxVPk4QIHetvB3YQFnoECBEQAQ&url=https%3A%2F%2Frepository.library.noaa.gov%2Fview%2Fnoaa%2F49765%2Fnoaa_49765_DS1.pdf&usg=AOvVaw04Y_Ne76BoqhdAl9F8IWyd&opi=89978449", "Sigourney DB, Murray KT, Gilbert JR, Ver Hoef JM, Josephson E, DiGiovanni R (2020) Application of a Bayesian hierarchical model to estimate trends in Atlantic harbor seal (Phoca vitulina vitulina) abundance in Maine, U.S.A., 1993-2018. Marine Mammal Science. DOI: 10.1111/mms.12873."), br(),
                                                                                                 tags$a(href="https://academic.oup.com/jmammal/article/101/1/121/5675096", "Wood SA, Murray KT, Josephson E, Gilbert J (2020) Rates of increase in gray seal (Halichoerus grypus atlantica) pupping at recolonized sites in the United States, 1988-2019. Journal of Mammalogy 101(1):121-128"), br(),
                                                                                                 tags$a(href="https://repository.library.noaa.gov/view/noaa/46455", "Wood SA, Josephson E, Precoda K, Murray KT (2022). Gray seal (Halichoerus grypus) pupping trends and 2021 population estimates in U.S. waters. NEFSC Ref Doc. 22-14; 16 p."), 
    )                                                                                             
    ))





