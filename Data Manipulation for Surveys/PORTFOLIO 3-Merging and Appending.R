setwd("R:/Business Strategy_Analytics/Garrett Georgia/Survey Data/Bounceback Overall Data")

#IMPORT FILES (ALL CSV FILES IN A GIVEN FOLDER)
temp = list.files(pattern="*.csv")
myfiles = lapply(temp, read.delim)
temp = list.files(pattern="*.csv")
for (i in 1:length(temp)) assign(temp[i], read.csv(temp[i]))

rm(i, myfiles, temp)


#==================================
library(gdata)
rm(`Decision factor.csv`)
rm(`Length of Residence.csv`)
rm(`Consider Season Plan.csv`)
rm(`Against Season Plan.csv`)
rm(Attendance.csv)
rm(`To Attend Future Games.csv`)


Promotion1 <-as.data.frame(`Promotion1.csv`)
rm(`Promotion1.csv`)

Promotion2 <-as.data.frame(`Promotion2.csv`)
rm(`Promotion2.csv`)

Promotion3 <-as.data.frame(`Promotion3.csv`)
rm(`Promotion3.csv`)

Promotion4 <-as.data.frame(`Promotion4.csv`)
rm(`Promotion4.csv`)

Promotion5 <-as.data.frame(`Promotion5.csv`)
rm(`Promotion5.csv`)

Promotion6 <-as.data.frame(`Promotion6.csv`)
rm(`Promotion6.csv`)

#============
MERGE1 <-cbindX(data.frame(Promotion1), data.frame(Promotion2),data.frame(Promotion3),data.frame(Promotion4), data.frame(Promotion5), data.frame(Promotion6))

rm(Promotion1, Promotion2, Promotion3, Promotion4)
rm(Promotion5)
rm(Promotion6)

#============
Master.Word.Count.Frequency <-as.data.frame(`Master Word Count Frequency.csv`)
rm(`Master Word Count Frequency.csv`)
#============

MERGE2 <-Master.Word.Count.Frequency
rm(Master.Word.Count.Frequency)
#============
rm(`Very Neg Aff.csv`, `Neg Aff.csv`, `Pos Aff.csv`, `Very Pos Aff.csv` )
#============
Word.Affiliation <-as.data.frame(`Word Affiliation.csv`)
rm(`Word Affiliation.csv`)
#============
rm(`Overall Word Frequency.csv`)
rm(`Negative Word Frequency.csv`)
rm(`Neutral Word Frequency.csv`)
rm(`Positive Word Frequency.csv`)
#============

Scoring.System.Pie <-as.data.frame(`Scoring System 1 and 2 Pie.csv`)
rm(`Scoring System 1 and 2 Pie.csv`)

Scoring.System.Table <-as.data.frame(`Scoring System 1 and 2 Table.csv`)
rm(`Scoring System 1 and 2 Table.csv`)

#============
MERGE3 <-cbindX(data.frame(Scoring.System.Pie), data.frame(Scoring.System.Table),data.frame(Word.Affiliation))
rm(Scoring.System.Pie,Scoring.System.Table, Word.Affiliation)
rm(`Scoring System 1 Pie Table.csv`)
rm(`Scoring System 1 Table.csv`)
rm(`Scoring System 2 Pie Table.csv`)
rm(`Scoring System 2 Table.csv`)
#============
MERGE4 <-Reason.No.Season.Plan_Totals.csv
rm(`Reason.No.Season.Plan_Totals.csv`)

MERGE5 <-as.data.frame(`Percent.Aggregate.csv`)
rm(`Percent.Aggregate.csv`)
names(MERGE5)[1] <- "Decision.Factor.Influence"


MASTERMERGEBBEMAIL <-cbindX(data.frame(MERGE1), data.frame(MERGE2),data.frame(MERGE3), data.frame(MERGE4), data.frame(MERGE5))
rm(MERGE1, MERGE2, MERGE3, MERGE4, MERGE5)
#============
write.csv(MASTERMERGEBBEMAIL,"R:/Business Strategy_Analytics/Garrett Georgia/Survey Data/Bounceback Overall Data/Tableau Files/TableauBBcharts.csv", row.names=FALSE )
write.csv(BBSURVEYSTEP1MERGE.csv,"R:/Business Strategy_Analytics/Garrett Georgia/Survey Data/Bounceback Overall Data/Tableau Files/BBSURVEYSTEP1MERGE.csv", row.names=FALSE )
