#WORKING DIRECTORY (WILL CHANGE DEPENDING ON WHICH HOMESTAND IS BEING PULLED)
#REMEMBER TO MOVE DOWNLOAD FILES TO PROPER FOLDER
setwd("C:/Users/ggeorgia/Downloads")

#DOWNLOAD THESE BUYER TYPES FOR EACH HOMESTAND
#ADLTBX
#ADLTFO
#ADLTKS
#ADLTWB
#ADLTOU



#IMPORT FILES (ALL CSV FILES IN A GIVEN FOLDER)
temp = list.files(pattern="*.csv")
myfiles = lapply(temp, read.delim)
temp = list.files(pattern="*.csv")
for (i in 1:length(temp)) assign(temp[i], read.csv(temp[i]))

#BIND ALL CSV FILES UNDER ONE DATA FRAME
files = list.files(pattern="*.csv")
myfiles = do.call("rbind",
                  lapply(files,
                         function(x) read.csv(x,
                                              stringsAsFactors = FALSE)))


#DEDUPE BY EMAIL AND ACCOUNT ID
myfiles = myfiles[!duplicated(myfiles$FINANCIAL_EMAIL), ]
myfiles = myfiles[!duplicated(myfiles$FINANCIAL_ACCOUNT_ID), ]

#DELETE UNNECESSARY FILES
rm(list=setdiff(ls(), "myfiles"))


#SPH AND BROKER REFERENCE
setwd("R:/Business Strategy_Analytics/Garrett Georgia/Season Plan Holder Analysis")
SPH.BROKER.REF <-read.csv("Master Broker Suites Sponsors Karl SPH as of 7.16.csv")


#IDENTIFY AND REMOVE ACCOUNTS WITH SAME ID
myfiles<- myfiles[ which(myfiles$FINANCIAL_ACCOUNT_ID!=""), ]
myfiles$MATCH_ID <- myfiles$FINANCIAL_ACCOUNT_ID %in% SPH.BROKER.REF$FINANCIAL_ACCOUNT_ID
myfiles<- myfiles[ which(myfiles$MATCH_ID=="FALSE"), ]
myfiles$MATCH_ID <-NULL

#=========================
#IDENTIFY AND REMOVE ACCOUNTS WITH SAME EMAIL OR PHONE
MASTER.REF<-read.csv("R:/Business Strategy_Analytics/Garrett Georgia/Season Plan Holder Analysis/NEW REFERENCE/MASTER REFERENCE.csv")

myfiles$MATCH_ID1 <- myfiles$FINANCIAL_EMAIL %in% MASTER.REF$EMAIL
myfiles$MATCH_ID2 <- myfiles$FINANCIAL_PRI_PHONE_DISPLAY %in% MASTER.REF$PHONE
myfiles$MATCH_ID3 <- myfiles$FINANCIAL_SEC_PHONE_DISPLAY %in% MASTER.REF$PHONE


myfiles<- myfiles[ which(myfiles$MATCH_ID1=="FALSE"), ]
myfiles<- myfiles[ which(myfiles$MATCH_ID2=="FALSE"), ]
myfiles<- myfiles[ which(myfiles$MATCH_ID3=="FALSE"), ]

myfiles$MATCH_ID1 <-NULL
myfiles$MATCH_ID2 <-NULL
myfiles$MATCH_ID3 <-NULL

#MAKE MASTER SET
Master<-myfiles

#Remove Columns (Can Also remove by Name of column in quotes)
myfiles <- myfiles[c("FINANCIAL_FIRST_NAME","FINANCIAL_LAST_NAME","FINANCIAL_EMAIL","FINANCIAL_ADDRESS_1","FINANCIAL_ADDRESS_2","FINANCIAL_CITY","FINANCIAL_SUBCOUNTRY_CODE","FINANCIAL_POSTAL_CODE","FINANCIAL_PRI_PHONE_DISPLAY","FINANCIAL_SEC_PHONE_DISPLAY","FINANCIAL_ACCOUNT_NAME","FINANCIAL_ACCOUNT_ID")]


#RENAME COLUMNS
colnames(myfiles)[colnames(myfiles)
                  == 'FINANCIAL_FIRST_NAME'] <- 'First Name'
colnames(myfiles)[colnames(myfiles)
                  == 'FINANCIAL_LAST_NAME'] <- 'Last Name'
colnames(myfiles)[colnames(myfiles)
                  == 'FINANCIAL_EMAIL'] <- 'Email Address'
colnames(myfiles)[colnames(myfiles)
                  == 'FINANCIAL_ADDRESS_1'] <- 'Address 1'
colnames(myfiles)[colnames(myfiles)
                  == 'FINANCIAL_ADDRESS_2'] <- 'Address 2'
colnames(myfiles)[colnames(myfiles)
                  == 'FINANCIAL_CITY'] <- 'City'
colnames(myfiles)[colnames(myfiles)
                  == 'FINANCIAL_SUBCOUNTRY_CODE'] <- 'State'
colnames(myfiles)[colnames(myfiles)
                  == 'FINANCIAL_POSTAL_CODE'] <- 'Postal Code'
colnames(myfiles)[colnames(myfiles)
                  == 'FINANCIAL_PRI_PHONE_DISPLAY'] <- 'Home Phone'
colnames(myfiles)[colnames(myfiles)
                  == 'FINANCIAL_SEC_PHONE_DISPLAY'] <- 'Mobile Phone'
colnames(myfiles)[colnames(myfiles)
                  == 'FINANCIAL_ACCOUNT_NAME'] <- 'Business Company Name'
colnames(myfiles)[colnames(myfiles)
                  == 'FINANCIAL_ACCOUNT_ID'] <- 'CRMID Archtics ID'


#NULL ROW.NAMES COLUMN
row.names(myfiles) <- NULL


#Write
write.csv(myfiles, "R:/Ticket Sales/2015/Joe Meyers/Lead Lists/Turnkey Upload-Download/Turnkey-Modified for upload/September/SeptemberFormatted.csv", row.names=FALSE)
write.csv(Master, "R:/Ticket Sales/2015/Joe Meyers/Lead Lists/Turnkey Upload-Download/Turnkey-Modified for upload/September/SeptemberMaster.csv", row.names=FALSE)



