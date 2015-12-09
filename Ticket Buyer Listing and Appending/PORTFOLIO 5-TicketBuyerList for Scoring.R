#=============================================================================================

###MERGE PROCESS#### ONCE SCORES ARE GENERATED FROM TURNKEY

#GET MASTER DOC (WITH SEAT INFO)#
#REMMBER TO FIND MASTER FILE IF DOING GAME BY GAME
setwd("R:/Ticket Sales/2015/Joe Meyers/Lead Lists/Turnkey Upload-Download/Turnkey-Modified for upload/September")
Master<-read.csv("September3456789Master.csv")

#GET RETURNED INFO FROM TURNKEY
setwd("R:/Ticket Sales/2015/Joe Meyers/Lead Lists/Turnkey Upload-Download/Turnkey-Returned after upload/September")
#Here we have 8 Columns: ProspectID	First Name	Last Name	Email	2015 Nationals Capacity Model	2015 Nationals Capacity Model Date Scored	2015 Nationals Priority Model	2015 Nationals Priority Model Date Scored
Scores<-read.csv("Scores.csv")
#This is the returned Homestand csv file that has the merge id's, etc. First Name	Last Name	Email Address	Address 1	Address 2	City	State	Postal Code	Home Phone	Mobile Phone	Business Company Name	CRMID Archtics ID	Matching Prospect ID	Message	ImportDate
Homestand<-read.csv("Upload.csv")


#SORT#
Master$FINANCIAL_ACCOUNT_ID<-as.numeric(Master$FINANCIAL_ACCOUNT_ID)
Master <- Master[order(Master$FINANCIAL_ACCOUNT_ID) , ]


colnames(Homestand)[colnames(Homestand)
                    == 'CRMID.Archtics.ID'] <- 'FINANCIAL_ACCOUNT_ID'

Homestand$FINANCIAL_ACCOUNT_ID<-as.numeric(Homestand$FINANCIAL_ACCOUNT_ID)
Homestand <- Homestand[order(Homestand$FINANCIAL_ACCOUNT_ID) , ]
Homestand<- Homestand[c(12,13)]

#MERGE 1
Master <- merge(Master,Homestand,by=c("FINANCIAL_ACCOUNT_ID"))

colnames(Master)[colnames(Master)
                 == 'Matching.Prospect.ID'] <- 'ProspectID'


#SCORES (SORT & APPEND)
Scores$ProspectID<-as.numeric(Scores$ProspectID)
Scores <- Scores[order(Scores$ProspectID) , ]
Scores<- Scores[c(1,5,7)]

#MERGE 2
Master <- merge(Master,Scores,by=c("ProspectID"))
Master<- Master[c(2,5,10,11,12,14,13,17,20,23,35,42,51,53,54,55,59,63,92,93)]

Master$Tier[Master$X2015.Nationals.Priority.Model ==5 & Master$X2015.Nationals.Capacity.Model ==5]<-"A"
Master$Tier[Master$X2015.Nationals.Priority.Model ==5 & Master$X2015.Nationals.Capacity.Model ==4]<-"B"
Master$Tier[Master$X2015.Nationals.Priority.Model ==4 & Master$X2015.Nationals.Capacity.Model ==5]<-"C"
Master$Tier[Master$X2015.Nationals.Priority.Model <= 4 & Master$X2015.Nationals.Capacity.Model <= 4]<-"D"
Master$Tier[Master$X2015.Nationals.Priority.Model ==5  & Master$X2015.Nationals.Capacity.Model <= 3]<-"D"
Master$Tier[Master$X2015.Nationals.Priority.Model <=3  & Master$X2015.Nationals.Capacity.Model == 5]<-"D"


#SUBSET FOR CALL LIST
Call.List<-subset(Master,
                  Tier== "A" |
                    Tier==  "B"|
                    Tier==  "C") 

Call.List <- Call.List[order(Call.List$Tier) , ]

#

Master$SEAT_RANGE <-gsub("-"," -- ",Master$SEAT_RANGE)
Call.List$SEAT_RANGE <-gsub("-"," -- ",Call.List$SEAT_RANGE)
######
#Write Files
write.csv(Master, "R:/Ticket Sales/2015/Joe Meyers/Lead Lists/ScoreCards/September/Master SCORED.csv", row.names=FALSE)
write.csv(Call.List, "R:/Ticket Sales/2015/Joe Meyers/Lead Lists/ScoreCards/September/Call List.csv", row.names=FALSE)

