setwd("R:/Business Strategy_Analytics/Corp Market Analyses/Corporate Merge (tix and location data)/Data Files")

library(ggplot2)
library(maps)
#load us map data
all_states <- map_data("state")
#plot all states with ggplot
p <- ggplot()
p <- p + geom_polygon( data=all_states, aes(x=long, y=lat, group = group),colour="white", fill="grey10" )

states <- subset(all_states, region %in% c( "maryland", "virginia", "district of columbia") )
p <- ggplot()
p <- p + geom_polygon( data=states, aes(x=long, y=lat, group = group),colour="white", fill="gray50" )
p

library(xlsx)
mydata<-read.xlsx("Corporate Accts.xlsx", sheetName='CORP ACCTS',stringsAsFactors=FALSE)

colnames(mydata)[colnames(mydata)
                   == 'Lat'] <- 'lat'
colnames(mydata)[colnames(mydata)
                 == 'Lon'] <- 'long'
colnames(mydata)[colnames(mydata)
                 == 'Ticket.Package.Amount'] <- 'PACKAGE_TICKET_AMT'


p <- ggplot()
p <- p + geom_polygon( data=states, aes(x=long, y=lat, group = group),colour="white" )

#COMPLETED MERGE
basic <- p + geom_point( data=mydata, aes(x=long, y=lat), color="coral1") + scale_size(name="Revenue")
Revenue_map <- p + geom_point( data=mydata, aes(x=long, y=lat, size = Revenue), color="coral1") + scale_size(name="Revenue")
TicketPackage_map <- p + geom_point( data=mydata, aes(x=long, y=lat, size = PACKAGE_TICKET_AMT), color="coral1") + scale_size(name="Ticket Package Total")
Employee_map <- p + geom_point( data=mydata, aes(x=long, y=lat, size = Employee.Total), color="coral1") + scale_size(name="Employee Total")

basic
Revenue_map
TicketPackage_map
Employee_map
