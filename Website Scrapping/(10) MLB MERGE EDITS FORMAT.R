# MERGE EDITS
#=============================================================
rm(list=setdiff(ls(), "MERGED"))
setwd("C:/Users/Garrett/Google Drive/Career/Companies/Accepted Companies/Washington Nationals/Work/Standings")
MERGED = read.csv("MASTER_FILE.csv", header=TRUE)


names(MERGED)[1] <- "TEAM"
names(MERGED)[2] <- "WINS"
names(MERGED)[3] <- "LOSSES"
names(MERGED)[4] <- "W/L %"
names(MERGED)[5] <- "GB"
names(MERGED)[6] <- "GAME DATE"


MERGED <- MERGED[ which(MERGED$TEAM!='Tm'), ]
row.names(MERGED) <- NULL

MERGED$WINS <- as.character(MERGED$WINS)
MERGED$WINS <- as.numeric(MERGED$WINS)

MERGED$LOSSES <- as.character(MERGED$LOSSES)
MERGED$LOSSES <- as.numeric(MERGED$LOSSES)

MERGED$"W/L %" <- as.character(MERGED$"W/L %")
MERGED$"W/L %" <- as.numeric(MERGED$"W/L %")

MERGED$GAMESPLAYED <- (MERGED$WINS + MERGED$LOSSES)

MERGED$"GAME DATE" <- gsub(".", "-", MERGED$"GAME DATE", fixed = TRUE)
MERGED$"GAME DATE" <- as.Date(MERGED$"GAME DATE")


#==============================================================

BAL<- MERGED[ which(MERGED$TEAM=='BAL'), ]
NYY<- MERGED[ which(MERGED$TEAM=='NYY'), ]
TBR<- MERGED[ which(MERGED$TEAM=='TBR'), ]
TOR<- MERGED[ which(MERGED$TEAM=='TOR'), ]
BOS<- MERGED[ which(MERGED$TEAM=='BOS'), ]
CLE<- MERGED[ which(MERGED$TEAM=='CLE'), ]
MIN<- MERGED[ which(MERGED$TEAM=='MIN'), ]
DET<- MERGED[ which(MERGED$TEAM=='DET'), ]
KCR<- MERGED[ which(MERGED$TEAM=='KCR'), ]
CHW<- MERGED[ which(MERGED$TEAM=='CHW'), ]
HOU<- MERGED[ which(MERGED$TEAM=='HOU'), ]
SEA<- MERGED[ which(MERGED$TEAM=='SEA'), ]
OAK<- MERGED[ which(MERGED$TEAM=='OAK'), ]
LAA<- MERGED[ which(MERGED$TEAM=='LAA'), ]
TEX<- MERGED[ which(MERGED$TEAM=='TEX'), ]
PHI<- MERGED[ which(MERGED$TEAM=='PHI'), ]
WSN<- MERGED[ which(MERGED$TEAM=='WSN'), ]
ATL<- MERGED[ which(MERGED$TEAM=='ATL'), ]
NYM<- MERGED[ which(MERGED$TEAM=='NYM'), ]
MIA<- MERGED[ which(MERGED$TEAM=='MIA'), ]
STL<- MERGED[ which(MERGED$TEAM=='STL'), ]
CHC<- MERGED[ which(MERGED$TEAM=='CHC'), ]
CIN<- MERGED[ which(MERGED$TEAM=='CIN'), ]
MIL<- MERGED[ which(MERGED$TEAM=='MIL'), ]
PIT<- MERGED[ which(MERGED$TEAM=='PIT'), ]
ARI<- MERGED[ which(MERGED$TEAM=='ARI'), ]
LAD<- MERGED[ which(MERGED$TEAM=='LAD'), ]
SDP<- MERGED[ which(MERGED$TEAM=='SDP'), ]
COL<- MERGED[ which(MERGED$TEAM=='COL'), ]
SFG<- MERGED[ which(MERGED$TEAM=='SFG'), ]



#=========================================================

BAL.NEW <- as.data.frame(BAL$GAMESPLAYED[-1] - BAL$GAMESPLAYED[-length(BAL$GAMESPLAYED)])
NYY.NEW <- as.data.frame(NYY$GAMESPLAYED[-1] - NYY$GAMESPLAYED[-length(NYY$GAMESPLAYED)])
TBR.NEW <- as.data.frame(TBR$GAMESPLAYED[-1] - TBR$GAMESPLAYED[-length(TBR$GAMESPLAYED)])
TOR.NEW <- as.data.frame(TOR$GAMESPLAYED[-1] - TOR$GAMESPLAYED[-length(TOR$GAMESPLAYED)])
BOS.NEW <- as.data.frame(BOS$GAMESPLAYED[-1] - BOS$GAMESPLAYED[-length(BOS$GAMESPLAYED)])
CLE.NEW <- as.data.frame(CLE$GAMESPLAYED[-1] - CLE$GAMESPLAYED[-length(CLE$GAMESPLAYED)])
MIN.NEW <- as.data.frame(MIN$GAMESPLAYED[-1] - MIN$GAMESPLAYED[-length(MIN$GAMESPLAYED)])
DET.NEW <- as.data.frame(DET$GAMESPLAYED[-1] - DET$GAMESPLAYED[-length(DET$GAMESPLAYED)])
KCR.NEW <- as.data.frame(KCR$GAMESPLAYED[-1] - KCR$GAMESPLAYED[-length(KCR$GAMESPLAYED)])
CHW.NEW <- as.data.frame(CHW$GAMESPLAYED[-1] - CHW$GAMESPLAYED[-length(CHW$GAMESPLAYED)])
HOU.NEW <- as.data.frame(HOU$GAMESPLAYED[-1] - HOU$GAMESPLAYED[-length(HOU$GAMESPLAYED)])
SEA.NEW <- as.data.frame(SEA$GAMESPLAYED[-1] - SEA$GAMESPLAYED[-length(SEA$GAMESPLAYED)])
OAK.NEW <- as.data.frame(OAK$GAMESPLAYED[-1] - OAK$GAMESPLAYED[-length(OAK$GAMESPLAYED)])
LAA.NEW <- as.data.frame(LAA$GAMESPLAYED[-1] - LAA$GAMESPLAYED[-length(LAA$GAMESPLAYED)])
TEX.NEW <- as.data.frame(TEX$GAMESPLAYED[-1] - TEX$GAMESPLAYED[-length(TEX$GAMESPLAYED)])
PHI.NEW <- as.data.frame(PHI$GAMESPLAYED[-1] - PHI$GAMESPLAYED[-length(PHI$GAMESPLAYED)])
WSN.NEW <- as.data.frame(WSN$GAMESPLAYED[-1] - WSN$GAMESPLAYED[-length(WSN$GAMESPLAYED)])
ATL.NEW <- as.data.frame(ATL$GAMESPLAYED[-1] - ATL$GAMESPLAYED[-length(ATL$GAMESPLAYED)])
NYM.NEW <- as.data.frame(NYM$GAMESPLAYED[-1] - NYM$GAMESPLAYED[-length(NYM$GAMESPLAYED)])
MIA.NEW <- as.data.frame(MIA$GAMESPLAYED[-1] - MIA$GAMESPLAYED[-length(MIA$GAMESPLAYED)])
STL.NEW <- as.data.frame(STL$GAMESPLAYED[-1] - STL$GAMESPLAYED[-length(STL$GAMESPLAYED)])
CHC.NEW <- as.data.frame(CHC$GAMESPLAYED[-1] - CHC$GAMESPLAYED[-length(CHC$GAMESPLAYED)])
CIN.NEW <- as.data.frame(CIN$GAMESPLAYED[-1] - CIN$GAMESPLAYED[-length(CIN$GAMESPLAYED)])
MIL.NEW <- as.data.frame(MIL$GAMESPLAYED[-1] - MIL$GAMESPLAYED[-length(MIL$GAMESPLAYED)])
PIT.NEW <- as.data.frame(PIT$GAMESPLAYED[-1] - PIT$GAMESPLAYED[-length(PIT$GAMESPLAYED)])
ARI.NEW <- as.data.frame(ARI$GAMESPLAYED[-1] - ARI$GAMESPLAYED[-length(ARI$GAMESPLAYED)])
LAD.NEW <- as.data.frame(LAD$GAMESPLAYED[-1] - LAD$GAMESPLAYED[-length(LAD$GAMESPLAYED)])
SDP.NEW <- as.data.frame(SDP$GAMESPLAYED[-1] - SDP$GAMESPLAYED[-length(SDP$GAMESPLAYED)])
COL.NEW <- as.data.frame(COL$GAMESPLAYED[-1] - COL$GAMESPLAYED[-length(COL$GAMESPLAYED)])
SFG.NEW <- as.data.frame(SFG$GAMESPLAYED[-1] - SFG$GAMESPLAYED[-length(SFG$GAMESPLAYED)])


#=============================================================

newrow = c(0)
newrow <- as.data.frame(newrow)

#=============================================================

names(BAL.NEW)[1] <- "newrow"
names(NYY.NEW)[1] <- "newrow"
names(TBR.NEW)[1] <- "newrow"
names(TOR.NEW)[1] <- "newrow"
names(BOS.NEW)[1] <- "newrow"
names(CLE.NEW)[1] <- "newrow"
names(MIN.NEW)[1] <- "newrow"
names(DET.NEW)[1] <- "newrow"
names(KCR.NEW)[1] <- "newrow"
names(CHW.NEW)[1] <- "newrow"
names(HOU.NEW)[1] <- "newrow"
names(SEA.NEW)[1] <- "newrow"
names(OAK.NEW)[1] <- "newrow"
names(LAA.NEW)[1] <- "newrow"
names(TEX.NEW)[1] <- "newrow"
names(PHI.NEW)[1] <- "newrow"
names(WSN.NEW)[1] <- "newrow"
names(ATL.NEW)[1] <- "newrow"
names(NYM.NEW)[1] <- "newrow"
names(MIA.NEW)[1] <- "newrow"
names(STL.NEW)[1] <- "newrow"
names(CHC.NEW)[1] <- "newrow"
names(CIN.NEW)[1] <- "newrow"
names(MIL.NEW)[1] <- "newrow"
names(PIT.NEW)[1] <- "newrow"
names(ARI.NEW)[1] <- "newrow"
names(LAD.NEW)[1] <- "newrow"
names(SDP.NEW)[1] <- "newrow"
names(COL.NEW)[1] <- "newrow"
names(SFG.NEW)[1] <- "newrow"


#===========================================================

BAL.NEW=rbind(newrow, BAL.NEW)
NYY.NEW=rbind(newrow, NYY.NEW)
TBR.NEW=rbind(newrow, TBR.NEW)
TOR.NEW=rbind(newrow, TOR.NEW)
BOS.NEW=rbind(newrow, BOS.NEW)
CLE.NEW=rbind(newrow, CLE.NEW)
MIN.NEW=rbind(newrow, MIN.NEW)
DET.NEW=rbind(newrow, DET.NEW)
KCR.NEW=rbind(newrow, KCR.NEW)
CHW.NEW=rbind(newrow, CHW.NEW)
HOU.NEW=rbind(newrow, HOU.NEW)
SEA.NEW=rbind(newrow, SEA.NEW)
OAK.NEW=rbind(newrow, OAK.NEW)
LAA.NEW=rbind(newrow, LAA.NEW)
TEX.NEW=rbind(newrow, TEX.NEW)
PHI.NEW=rbind(newrow, PHI.NEW)
WSN.NEW=rbind(newrow, WSN.NEW)
ATL.NEW=rbind(newrow, ATL.NEW)
NYM.NEW=rbind(newrow, NYM.NEW)
MIA.NEW=rbind(newrow, MIA.NEW)
STL.NEW=rbind(newrow, STL.NEW)
CHC.NEW=rbind(newrow, CHC.NEW)
CIN.NEW=rbind(newrow, CIN.NEW)
MIL.NEW=rbind(newrow, MIL.NEW)
PIT.NEW=rbind(newrow, PIT.NEW)
ARI.NEW=rbind(newrow, ARI.NEW)
LAD.NEW=rbind(newrow, LAD.NEW)
SDP.NEW=rbind(newrow, SDP.NEW)
COL.NEW=rbind(newrow, COL.NEW)
SFG.NEW=rbind(newrow, SFG.NEW)

#===========================================================

BAL$GAMEDAY <- BAL.NEW$newrow
NYY$GAMEDAY <- NYY.NEW$newrow
TBR$GAMEDAY <- TBR.NEW$newrow
TOR$GAMEDAY <- TOR.NEW$newrow
BOS$GAMEDAY <- BOS.NEW$newrow
CLE$GAMEDAY <- CLE.NEW$newrow
MIN$GAMEDAY <- MIN.NEW$newrow
DET$GAMEDAY <- DET.NEW$newrow
KCR$GAMEDAY <- KCR.NEW$newrow
CHW$GAMEDAY <- CHW.NEW$newrow
HOU$GAMEDAY <- HOU.NEW$newrow
SEA$GAMEDAY <- SEA.NEW$newrow
OAK$GAMEDAY <- OAK.NEW$newrow
LAA$GAMEDAY <- LAA.NEW$newrow
TEX$GAMEDAY <- TEX.NEW$newrow
PHI$GAMEDAY <- PHI.NEW$newrow
WSN$GAMEDAY <- WSN.NEW$newrow
ATL$GAMEDAY <- ATL.NEW$newrow
NYM$GAMEDAY <- NYM.NEW$newrow
MIA$GAMEDAY <- MIA.NEW$newrow
STL$GAMEDAY <- STL.NEW$newrow
CHC$GAMEDAY <- CHC.NEW$newrow
CIN$GAMEDAY <- CIN.NEW$newrow
MIL$GAMEDAY <- MIL.NEW$newrow
PIT$GAMEDAY <- PIT.NEW$newrow
ARI$GAMEDAY <- ARI.NEW$newrow
LAD$GAMEDAY <- LAD.NEW$newrow
SDP$GAMEDAY <- SDP.NEW$newrow
COL$GAMEDAY <- COL.NEW$newrow
SFG$GAMEDAY <- SFG.NEW$newrow

#===========================================================

rm(newrow)
rm(BAL.NEW)
rm(NYY.NEW)
rm(TBR.NEW)
rm(TOR.NEW)
rm(BOS.NEW)
rm(CLE.NEW)
rm(MIN.NEW)
rm(DET.NEW)
rm(KCR.NEW)
rm(CHW.NEW)
rm(HOU.NEW)
rm(SEA.NEW)
rm(OAK.NEW)
rm(LAA.NEW)
rm(TEX.NEW)
rm(PHI.NEW)
rm(WSN.NEW)
rm(ATL.NEW)
rm(NYM.NEW)
rm(MIA.NEW)
rm(STL.NEW)
rm(CHC.NEW)
rm(CIN.NEW)
rm(MIL.NEW)
rm(PIT.NEW)
rm(ARI.NEW)
rm(LAD.NEW)
rm(SDP.NEW)
rm(COL.NEW)
rm(SFG.NEW)

#==========================================================

#BAL<- BAL[ which(BAL$GAMEDAY>=1),]
#NYY<- NYY[ which(NYY$GAMEDAY>=1),]
#TBR<- TBR[ which(TBR$GAMEDAY>=1),]
#TOR<- TOR[ which(TOR$GAMEDAY>=1),]
#BOS<- BOS[ which(BOS$GAMEDAY>=1),]
#CLE<- CLE[ which(CLE$GAMEDAY>=1),]
#MIN<- MIN[ which(MIN$GAMEDAY>=1),]
#DET<- DET[ which(DET$GAMEDAY>=1),]
#KCR<- KCR[ which(KCR$GAMEDAY>=1),]
#CHW<- CHW[ which(CHW$GAMEDAY>=1),]
#HOU<- HOU[ which(HOU$GAMEDAY>=1),]
#SEA<- SEA[ which(SEA$GAMEDAY>=1),]
#OAK<- OAK[ which(OAK$GAMEDAY>=1),]
#LAA<- LAA[ which(LAA$GAMEDAY>=1),]
#TEX<- TEX[ which(TEX$GAMEDAY>=1),]
#PHI<- PHI[ which(PHI$GAMEDAY>=1),]
#WSN<- WSN[ which(WSN$GAMEDAY>=1),]
#ATL<- ATL[ which(ATL$GAMEDAY>=1),]
#NYM<- NYM[ which(NYM$GAMEDAY>=1),]
#MIA<- MIA[ which(MIA$GAMEDAY>=1),]
#STL<- STL[ which(STL$GAMEDAY>=1),]
#CHC<- CHC[ which(CHC$GAMEDAY>=1),]
#CIN<- CIN[ which(CIN$GAMEDAY>=1),]
#MIL<- MIL[ which(MIL$GAMEDAY>=1),]
#PIT<- PIT[ which(PIT$GAMEDAY>=1),]
#ARI<- ARI[ which(ARI$GAMEDAY>=1),]
#LAD<- LAD[ which(LAD$GAMEDAY>=1),]
#SDP<- SDP[ which(SDP$GAMEDAY>=1),]
#COL<- COL[ which(COL$GAMEDAY>=1),]
#SFG<- SFG[ which(SFG$GAMEDAY>=1),]


#==========================================================

row.names(BAL) <- NULL
row.names(NYY) <- NULL
row.names(TBR) <- NULL
row.names(TOR) <- NULL
row.names(BOS) <- NULL
row.names(CLE) <- NULL
row.names(MIN) <- NULL
row.names(DET) <- NULL
row.names(KCR) <- NULL
row.names(CHW) <- NULL
row.names(HOU) <- NULL
row.names(SEA) <- NULL
row.names(OAK) <- NULL
row.names(LAA) <- NULL
row.names(TEX) <- NULL
row.names(PHI) <- NULL
row.names(WSN) <- NULL
row.names(ATL) <- NULL
row.names(NYM) <- NULL
row.names(MIA) <- NULL
row.names(STL) <- NULL
row.names(CHC) <- NULL
row.names(CIN) <- NULL
row.names(MIL) <- NULL
row.names(PIT) <- NULL
row.names(ARI) <- NULL
row.names(LAD) <- NULL
row.names(SDP) <- NULL
row.names(COL) <- NULL
row.names(SFG) <- NULL

#=======================================

#BAL <-BAL[c(-8)]
#NYY <-NYY[c(-8)]
#TBR <-TBR[c(-8)]
#TOR <-TOR[c(-8)]
#BOS <-BOS[c(-8)]
#CLE <-CLE[c(-8)]
#MIN <-MIN[c(-8)]
#DET <-DET[c(-8)]
#KCR <-KCR[c(-8)]
#CHW <-CHW[c(-8)]
#HOU <-HOU[c(-8)]
#SEA <-SEA[c(-8)]
#OAK <-OAK[c(-8)]
#LAA <-LAA[c(-8)]
#TEX <-TEX[c(-8)]
#PHI <-PHI[c(-8)]
#WSN <-WSN[c(-8)]
#ATL <-ATL[c(-8)]
#NYM <-NYM[c(-8)]
#MIA <-MIA[c(-8)]
#STL <-STL[c(-8)]
#CHC <-CHC[c(-8)]
#CIN <-CIN[c(-8)]
#MIL <-MIL[c(-8)]
#PIT <-PIT[c(-8)]
#ARI <-ARI[c(-8)]
#LAD <-LAD[c(-8)]
#SDP <-SDP[c(-8)]
#COL <-COL[c(-8)]
#SFG <-SFG[c(-8)]

#=======================================================

#COMPLETED
