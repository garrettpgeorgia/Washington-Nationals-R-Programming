#SET LOCATION
setwd("R:/Business Strategy_Analytics/Corp Market Analyses/Corporate Merge (tix and location data)/Data Files")

theData<-read.csv("Hoover Accts - Copy.csv")

#SINCE WE ALREADY HAVE PRIMARY ACCTS WITH 100+ M, 50+ EMPLOYEES, AND WITHIN 30 MILES OF BALLPARK, SUBSET HERE SO THAT NO COMPANY INCLUDES IT BY DEFAULT
theData$Revenue..M. <-as.numeric(theData$Revenue..M.)
theData$Total_Employees <-as.numeric(theData$Total_Employees)
theData$MILES.TO.BALLPARK<-as.numeric(theData$MILES.TO.BALLPARK)

#REMOVE HIGH PRIORITY TARGETS (ALREADY CALL LIST 1)
theData <- theData[ which(theData$Revenue..M. < 100 | theData$MILES.TO.BALLPARK > 30 | theData$Total_Employees < 50),]


#INDUSTRY SUBSET
Business_AND_Professional_Associations<-subset(theData, Primary_Industry=="Business & Professional Associations")
Consulting_Services<-subset(theData, Primary_Industry=="Consulting Services")
Real_Estate_AND_Building<-subset(theData, Primary_Industry=="Real Estate" | Primary_Industry=="Building Services")


#CITIES SUBSET (REMOVED INDUSTRIES IN OTHER CATEGORIES)
Tysons_Corner_And_Mclean<-subset(theData, Primary_City=="Tysons Corner" | Primary_City=="Mclean")
Tysons_Corner_And_Mclean <- Tysons_Corner_And_Mclean[ which(Tysons_Corner_And_Mclean$Primary_Industry!='Business & Professional Associations' 
                                                    & Tysons_Corner_And_Mclean$Primary_Industry!='Consulting Services'
                                                    & Tysons_Corner_And_Mclean$Primary_Industry!='Real Estate'
                                                    & Tysons_Corner_And_Mclean$Primary_Industry!='Building Services'),]


Arlington<-subset(theData, Primary_City=="Arlington")
Arlington <- Arlington[ which(Arlington$Primary_Industry!='Business & Professional Associations' 
                                                            & Arlington$Primary_Industry!='Consulting Services'
                                                            & Arlington$Primary_Industry!='Real Estate'
                                                            & Arlington$Primary_Industry!='Building Services'),]


library(xlsx)

setwd("R:/Business Strategy_Analytics/Corp Market Analyses/Corporate Merge (tix and location data)/Data Files/Prospect Call Lists")

write.xlsx(Tysons_Corner_And_Mclean, "Tysons Corner and Mclean.xlsx", row.names=FALSE)
write.xlsx(Arlington, "Arlington.xlsx", row.names=FALSE)
write.xlsx(Business_AND_Professional_Associations, "Business & Professional Associations.xlsx", row.names=FALSE)
write.xlsx(Consulting_Services, "Consulting Services.xlsx", row.names=FALSE)
write.xlsx(Real_Estate_AND_Building, "Real Estate & Building.xlsx", row.names=FALSE)
