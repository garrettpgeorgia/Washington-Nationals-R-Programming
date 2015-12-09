#READ IN 2013 RESULTS FOR NATS AS FILE, NOT XML TABLE

setwd("C:/Users/Garrett/Google Drive/Career/Companies/Accepted Companies/Washington Nationals/Work/Standings")
WSN2013 <- read.csv("2013NATS.csv", header = TRUE)
names(WSN2013)[9] <- "GAME DATE"
WSN2013$"GAME DATE" <- as.character(WSN2013$"GAME DATE")
WSN2013$"GAME DATE" <- as.Date(WSN2013$"GAME DATE")
WSN2013 <-WSN2013[c(9,3)]
WSN2013 = WSN2013[!duplicated(WSN2013$"GAME DATE"), ]
row.names(WSN2013) <- NULL

#NO NEED TO SUBSET B/C MERGE WILL DO AUTOMATICALLY. MAKE ANOTHER COPY TO PRESERVE ORIGINAL
WSN.2013.SUB <- WSN

WSN.2013.SUB <- merge(WSN.2013.SUB, WSN2013, by="GAME DATE")
rm(WSN2013)
#=====================================================

WSN2014 <- read.csv("2014NATS.csv", header = TRUE)
names(WSN2014)[4] <- "GAME DATE"
WSN2014$"GAME DATE" <- as.character(WSN2014$"GAME DATE")
WSN2014$"GAME DATE" <- as.Date(WSN2014$"GAME DATE")
WSN2014 <-WSN2014[c(4,3)]
WSN2014 = WSN2014[!duplicated(WSN2014$"GAME DATE"), ]
row.names(WSN2014) <- NULL

WSN.2014.SUB <- WSN

WSN.2014.SUB <- merge(WSN.2014.SUB, WSN2014, by="GAME DATE")
rm(WSN2014)

#=====================================================

WSN2015 <- read.csv("2015NATS.csv", header = TRUE)
names(WSN2015)[8] <- "GAME DATE"
WSN2015$"GAME DATE" <- as.character(WSN2015$"GAME DATE")
WSN2015$"GAME DATE" <- as.Date(WSN2015$"GAME DATE")
WSN2015 <-WSN2015[c(8,3)]
WSN2015 = WSN2015[!duplicated(WSN2015$"GAME DATE"), ]
row.names(WSN2015) <- NULL

WSN.2015.SUB <- WSN

WSN.2015.SUB <- merge(WSN.2015.SUB, WSN2015, by="GAME DATE")
rm(WSN2015)

#=====================================================

WSN2 <- rbind(WSN.2013.SUB,
             WSN.2014.SUB,
             WSN.2015.SUB)

rm(WSN.2013.SUB)
rm(WSN.2014.SUB)
rm(WSN.2015.SUB)

#=====================================================
WSN2$REFERENCE.DATE = WSN2$"GAME DATE"-1
WSN2$OPP.REF.DATE.MERGEID <- paste(WSN2$OPP.CODE, WSN2$REFERENCE.DATE, sep="-")
WSN2 <-WSN2[c("GAME DATE", "TEAM", "WINS", "LOSSES", "W/L %", "GB", "GAMESPLAYED", "GAMEDAY", "OPP.CODE", "REFERENCE.DATE", "OPP.REF.DATE.MERGEID")]

row.names(WSN2) <- NULL


WSN3 <- WSN[ which(WSN$GAMEDAY<=0), ]
row.names(WSN2) <- NULL
row.names(WSN3) <- NULL
WSN3 <-WSN3[c("GAME DATE", "TEAM", "WINS", "LOSSES", "W/L %", "GB", "GAMESPLAYED", "GAMEDAY")]
row.names(WSN2) <- NULL
row.names(WSN3) <- NULL


WSN3$OPP.CODE <- "NONE"
WSN3$REFERENCE.DATE <- WSN3$"GAME DATE"-1
WSN3$OPP.REF.DATE.MERGEID <- paste(WSN3$OPP.CODE, WSN3$REFERENCE.DATE, sep="-")

WSN2$"GAME DATE" <- as.Date(WSN2$"GAME DATE")
WSN3$"GAME DATE" <- as.Date(WSN3$"GAME DATE")

WSN2$REFERENCE.DATE <- as.Date(WSN2$REFERENCE.DATE)
WSN3$REFERENCE.DATE <- as.Date(WSN3$REFERENCE.DATE)


WSN2 <- rbind(WSN2, WSN3)
WSN2 <- WSN2[order(WSN2$"GAME DATE"),]


rm(WSN3)
WSN2 <-WSN2[c(1,2,9,11)]
row.names(WSN2) <- NULL
WSN <- WSN2
rm(WSN2)
#=========================================================
#COMPLETED
