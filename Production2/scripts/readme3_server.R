
DDtable<-read.csv("data/DataDesc.csv")
x<-xtable(DDtable)
output$tbl <- renderTable({ x }, bordered=TRUE)
