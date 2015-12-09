######MAKE "MASTER WALK UP.CSV (from multiple data files)

###WALKUP DEFINED AS...
#1 ADLTGR -Adult Grandstand
#2 ADLTBX -Adult Box Office
#3 ADLTKS -Adult Kiosk
#4 ADLTPR -Adult Premium Seating
#5 GOVT - Government Employee Discount
#6 MILTRY - Military
#7 SENIR - Senior Citizen Discount
#8 STU - Student Discount
#9 SPHBXF - Full SPH Discount
#10 SPHBXH - Half SPH Discount
#11 SPHBXP - Partial & Partner SPH Discount
#12 SPHPRT - Partial SPH Discount
#13 PNCBO PNC Visa Check Card Discount
#14 SROWEB Standing Room Only


#SET WORKING DIRECTORY
setwd("R:/Business Strategy_Analytics/Garrett Georgia/Walk Up Data/Data Files")
#IMPORT FILES (ALL CSV FILES IN A GIVEN FOLDER)
#REMEMBER TO KEEP ADDING NEW DATA FILES FOR ALL CATEGORIES TO THIS DATA FILES FOLDER!!!
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

#REMOVE UNNECESSARY FILES
rm(list=setdiff(ls(), "myfiles"))

#FORMAT DATE & TIME COLUMNS
myfiles$EVENT_USAGE_TIME<-substr(myfiles$EVENT_USAGE_DATE, 13, 21)
myfiles$TRANSACTION_TIME <-substr(myfiles$TRANSACTION_DATE, 13, 21)
myfiles$EVENT_USAGE_DATE<-substr(myfiles$EVENT_USAGE_DATE, 1, 11)
myfiles$TRANSACTION_DATE <-substr(myfiles$TRANSACTION_DATE, 1, 11)


#DETERMINE IF A GIVEN PURCHASE WAS A "WALK UP"
myfiles$WALK.UP.YES.NO <- myfiles$EVENT_USAGE_DATE==myfiles$TRANSACTION_DATE

#RENAME DATA FILE
Walk.up.2015 <-myfiles
rm(myfiles)


##############################
#IF WE AT SOME POINT ARE INTERESTED IN SALES THAT ARE NOT JUST DAY OF GAME WALK UP
##Day.Of.Game.Sales <-Walk.up.2015

#SUBSET TO WALKUPS = YES
Walk.up.2015<-subset(Walk.up.2015, WALK.UP.YES.NO =="TRUE")
Walk.up.2015<-subset(Walk.up.2015, PRICE_SCALE_DESC !="Party Suites")
Walk.up.2015<-subset(Walk.up.2015, PRICE_SCALE_DESC !="Jefferson Suites")
#KEEP CERTAIN COLUMNS
Walk.up.2015 <- Walk.up.2015[c("EVENT_CODE",
                               "EVENT_DESC",
                               "EVENT_USAGE_DATE",
                               "EVENT_USAGE_TIME",
                               "BUYER_TYPE_DESC",
                               "BUYER_TYPE_CODE",
                               "PRICE_SCALE_DESC",
                               "SECTION_DESC",
                               "TICKET_PRICE",
                               "TICKET_REF_PRICE",
                               "SEAT_QUANTITY",
                               "TRANSACTION_TIME"
                               )]

#Remove dashes in date
Walk.up.2015$EVENT_USAGE_DATE = gsub("-", "", Walk.up.2015$EVENT_USAGE_DATE)
#Create Day of Game Column
Walk.up.2015$Day_Of_Game <- Walk.up.2015$EVENT_USAGE_DATE
#Convert to date
Walk.up.2015$EVENT_USAGE_DATE <- as.Date(Walk.up.2015$EVENT_USAGE_DATE, "%d%B%Y")
Walk.up.2015$Day_Of_Game <- as.Date(Walk.up.2015$EVENT_USAGE_DATE, "%d%B%Y")

#Date Formatting
Walk.up.2015$EVENT_USAGE_DATE <-format(Walk.up.2015$EVENT_USAGE_DATE, format="%B %d %Y")
Walk.up.2015$Day_Of_Game <- weekdays(as.Date(Walk.up.2015$Day_Of_Game))

#REODER COLUMNS
Walk.up.2015 <- Walk.up.2015[c("EVENT_CODE",
                               "EVENT_DESC",
                               "Day_Of_Game",
                               "EVENT_USAGE_DATE",
                               "EVENT_USAGE_TIME",
                               "BUYER_TYPE_CODE",
                               "BUYER_TYPE_DESC",
                               "PRICE_SCALE_DESC",
                               "SECTION_DESC",
                               "TICKET_PRICE",
                               "TICKET_REF_PRICE",
                               "SEAT_QUANTITY",
                               "TRANSACTION_TIME"
)]

#SORT
Walk.up.2015 <- Walk.up.2015[order(Walk.up.2015$EVENT_CODE),]

#STANDING ROOM ONLY ADJUSTMENT (PUT PRICE FROM 5000 to 20)
GGWalk.up.2015<-subset(Walk.up.2015, PRICE_SCALE_DESC !="Standing Room Only")
GGGWalk.up.2015<-subset(Walk.up.2015, PRICE_SCALE_DESC =="Standing Room Only")

GGGWalk.up.2015$TICKET_REF_PRICE <- 20

Walk.up.2015 <- rbind(GGWalk.up.2015, GGGWalk.up.2015)

remove(GGWalk.up.2015)
remove(GGGWalk.up.2015)

GGWalk.up.2015<-subset(Walk.up.2015, TICKET_PRICE !=5000)
GGGWalk.up.2015<-subset(Walk.up.2015, TICKET_PRICE ==5000)
GGGWalk.up.2015$TICKET_PRICE <-20

Walk.up.2015 <- rbind(GGWalk.up.2015, GGGWalk.up.2015)
remove(GGWalk.up.2015)
remove(GGGWalk.up.2015)

Walk.up.2015$TICKET_PRICE <- as.numeric(Walk.up.2015$TICKET_PRICE)
Walk.up.2015$TICKET_REF_PRICE <- as.numeric(Walk.up.2015$TICKET_REF_PRICE)
Walk.up.2015$SEAT_QUANTITY <- as.numeric(Walk.up.2015$SEAT_QUANTITY)

#FOR ALL WALKUP SALES NUMBERS (DAY OF)
Walk.up.2015.total <- Walk.up.2015
rm(Walk.up.2015)
#SUBSET FOR TOTAL WALK UP DATA SALES VS WALK UP DATA DYNAMIC PRICING
#ADLTBX
#ADLTWB
#ADLTKS
#ADLTIV
#ADLTPH
#ADLTOU

#Walk.up.2015 <-subset(Walk.up.2015, BUYER_TYPE_CODE=="ADLTBX"|BUYER_TYPE_CODE=="ADLTWB"|BUYER_TYPE_CODE=="ADLTKS"
#                     |BUYER_TYPE_CODE=="ADLTIV"|BUYER_TYPE_CODE=="ADLTPH"|BUYER_TYPE_CODE=="ADLTOU")
  
#Walk.up.2015$DIFFERENCE <- Walk.up.2015$TICKET_PRICE - Walk.up.2015$TICKET_REF_PRICE
#Walk.up.2015$AMOUNT.SPENT <- Walk.up.2015$TICKET_PRICE * Walk.up.2015$SEAT_QUANTITY
#Walk.up.2015$PERCENT.INCREASE <- (Walk.up.2015$TICKET_PRICE / Walk.up.2015$TICKET_REF_PRICE)-1

#Edit Lexus President Club Front Row into Lexus Presidents Club
GGEDIT<-subset(Walk.up.2015.total, PRICE_SCALE_DESC =="Lexus President Club Front Row")
GGEDIT2<-subset(Walk.up.2015.total, PRICE_SCALE_DESC !="Lexus President Club Front Row")
GGEDIT$PRICE_SCALE_DESC="Lexus Presidents Club"
Walk.up.2015.total <- rbind(GGEDIT,GGEDIT2)
rm(GGEDIT, GGEDIT2)

Walk.up.2015.total$Total.Spent <-(Walk.up.2015.total$SEAT_QUANTITY)*(Walk.up.2015.total$TICKET_PRICE)

library(xlsx)

setwd("R:/Business Strategy_Analytics/Garrett Georgia/Walk Up Data/Merged File")
#write.xlsx(Walk.up.2015, "DYNAMIC.MASTER WALK UP.xlsx", row.names=FALSE)
write.csv(Walk.up.2015.total, "MASTER WALK UP.csv", row.names=FALSE)
