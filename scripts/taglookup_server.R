
#

tagTable <- eventReactive(input$k, {
  if (input$tagtype == "research"){
  nova <- odbcConnect("nova", uid="xxxx", pwd="xxxx",believeNRows=FALSE)
#  novaNew <- DBI::dbConnect(odbc::odbc(), dsn = 'nefscdb1.nmfs.local', uid="xxxx", pwd="xxxx", SERVICE_NAME = "NEFSC_USERS")
#  sole_con <- DBI::dbConnect(odbc::odbc(), dsn = 'sole', uid="xxxx", pwd="xxxx")
  
  
  
    #sql <- paste("select tagnum, to_char(dateland, 'dd-MON-yyyy') as tagdate, cruisenum, spcode, ageclassdesc as ageclass, sex from directedtakes d left join ageclass a on d.ageclass=a.ageclasscode where tagnum in ('",input$txt,"')", sep="")
    sql <- paste("select * from directedtakestidy where tagnum in ('",input$txt,"')", sep="")
    
    tag<-sqlQuery(nova, sql)
    tag<-data.frame(tag, stringsAsFactors = FALSE)

  }
  else if (input$tagtype == "bycatch"){
    nova <- odbcConnect("nova", uid="xxxx", pwd="xxxx",believeNRows=FALSE)
 
    sql <- paste("select tagnum1, comname, negear, year, tripid from allhauincspec where tagnum1 in ('",input$txt,"')", sep="")
    
    tag<-sqlQuery(nova, sql)
    tag<-data.frame(tag, stringsAsFactors = FALSE)  
  }
  
  return(tag)
})




# 
# #outputs
output$tagtable <- renderTable({
  tagTable()
})
#output$tagtable2 <- renderTable({
#  tagTable()
  
#})

#
#

#works
#nova <- odbcConnect(dsn="nova", uid="xxxx", pwd="xxxx",believeNRows=FALSE)
#or...
#novaDBI <- DBI::dbConnect(odbc::odbc(), dsn = 'NEFSCDB1.nmfs.local:1526/NEFSC_USERS', uid="xxxx", pwd="xxxx")

#not working
#novanew <- odbcConnect(dsn="nefscdb1.nmfs.local", dbname="NEFSC_USERS", uid="xxxx", pwd="xxxx",believeNRows=FALSE)
#novanew <- odbcConnect(dsn="NEFSC_USERS", uid="xxxx", pwd="xxxx",believeNRows=FALSE)
#novanewDBI <- DBI::dbConnect(odbc::odbc(), dsn = "nefscdb1.nmfs.local", uid="xxxx", pwd="xxxx", dbname="NEFSC_USERS")
#novanewDBI <- DBI::dbConnect(odbc::odbc(), dsn = "nefscdb1.nmfs.local", uid="xxxx", pwd="xxxx")