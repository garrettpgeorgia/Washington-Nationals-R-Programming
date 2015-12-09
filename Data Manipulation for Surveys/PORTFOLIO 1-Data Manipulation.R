setwd("R:/Business Strategy_Analytics/Garrett Georgia/Survey Data/Bounceback Overall Data/Data Files")

Search.text1 <- read.csv("1SURVEY.csv")
Search.text2 <- read.csv("2SURVEY.csv")
Search.text3 <- read.csv("3SURVEY.csv")
Search.text4 <- read.csv("4SURVEY.csv")
Search.text5 <- read.csv("5SURVEY.csv")
Search.text6 <- read.csv("6SURVEY.csv")
#================================
setwd("R:/Business Strategy_Analytics/Garrett Georgia/Survey Data/Bounceback Overall Data")
#================================
Day.of.game1 <-as.data.frame(substr(Search.text1$"X.Q1..1..WhichÂ.game.did.you.most.recently.attend.", 1, 4))
Day.of.game2 <-as.data.frame(substr(Search.text2$"X.Q1..1..WhichÂ.game.did.you.most.recently.attend.", 1, 4))
Day.of.game3 <-as.data.frame(substr(Search.text3$"X.Q1..1..WhichÂ.game.did.you.most.recently.attend.", 1, 4))
Day.of.game4 <-as.data.frame(substr(Search.text4$"X.Q1..1..WhichÂ.game.did.you.most.recently.attend.", 1, 4))
Day.of.game5 <-as.data.frame(substr(Search.text5$"X.Q1..1..WhichÂ.game.did.you.most.recently.attend.", 1, 4))
Day.of.game6 <-as.data.frame(substr(Search.text6$"X.Q1..1..WhichÂ.game.did.you.most.recently.attend.", 1, 4))
#================================
Month.of.game1 <-as.data.frame(substr(Search.text1$"X.Q1..1..WhichÂ.game.did.you.most.recently.attend.", 6, 8))
Month.of.game2 <-as.data.frame(substr(Search.text2$"X.Q1..1..WhichÂ.game.did.you.most.recently.attend.", 6, 8))
Month.of.game3 <-as.data.frame(substr(Search.text3$"X.Q1..1..WhichÂ.game.did.you.most.recently.attend.", 6, 8))
Month.of.game4 <-as.data.frame(substr(Search.text4$"X.Q1..1..WhichÂ.game.did.you.most.recently.attend.", 6, 8))
Month.of.game5 <-as.data.frame(substr(Search.text5$"X.Q1..1..WhichÂ.game.did.you.most.recently.attend.", 6, 8))
Month.of.game6 <-as.data.frame(substr(Search.text6$"X.Q1..1..WhichÂ.game.did.you.most.recently.attend.", 6, 8))
#================================
names(Day.of.game1)[1] <- "Text"
names(Day.of.game2)[1] <- "Text"
names(Day.of.game3)[1] <- "Text"
names(Day.of.game4)[1] <- "Text"
names(Day.of.game5)[1] <- "Text"
names(Day.of.game6)[1] <- "Text"
#================================
names(Month.of.game1)[1] <- "Text"
names(Month.of.game2)[1] <- "Text"
names(Month.of.game3)[1] <- "Text"
names(Month.of.game4)[1] <- "Text"
names(Month.of.game5)[1] <- "Text"
names(Month.of.game6)[1] <- "Text"
#================================

Day.of.game <- rbind(Day.of.game1,Day.of.game2, Day.of.game3, Day.of.game4, Day.of.game5, Day.of.game6)
rm(Day.of.game1, Day.of.game2, Day.of.game3, Day.of.game4, Day.of.game5, Day.of.game6)
#================================

Month.of.game <- rbind(Month.of.game1,Month.of.game2, Month.of.game3, Month.of.game4, Month.of.game5, Month.of.game6)
rm(Month.of.game1,Month.of.game2, Month.of.game3, Month.of.game4, Month.of.game5, Month.of.game6)
#================================

When.Attend1 <-as.data.frame(Search.text1$"X.Q49..11..When.did.you.decide.to.attend.that.game.")
When.Attend2 <-as.data.frame(Search.text2$"X.Q49..11..When.did.you.decide.to.attend.that.game.")
When.Attend3 <-as.data.frame(Search.text3$"X.Q49..11..When.did.you.decide.to.attend.that.game.")
When.Attend4 <-as.data.frame(Search.text4$"X.Q49..11..When.did.you.decide.to.attend.that.game.")
When.Attend5 <-as.data.frame(Search.text5$"X.Q49..11..When.did.you.decide.to.attend.that.game.")
When.Attend6 <-as.data.frame(Search.text6$"X.Q49..11..When.did.you.decide.to.attend.that.game.")
#================================
names(When.Attend1)[1] <- "Text"
names(When.Attend2)[1] <- "Text"
names(When.Attend3)[1] <- "Text"
names(When.Attend4)[1] <- "Text"
names(When.Attend5)[1] <- "Text"
names(When.Attend6)[1] <- "Text"
#================================
When.Attend <- rbind(When.Attend1, When.Attend2, When.Attend3, When.Attend4,When.Attend5, When.Attend6)
rm(When.Attend1, When.Attend2, When.Attend3, When.Attend4, When.Attend5, When.Attend6)
#================================
Day.of.game$Text <-gsub("Mon.","1) Monday",Day.of.game$Text)
Day.of.game$Text <-gsub("Tue.","2) Tuesday",Day.of.game$Text)
Day.of.game$Text <-gsub("Wed.","3) Wednesday",Day.of.game$Text)
Day.of.game$Text <-gsub("Thu.","4) Thursday",Day.of.game$Text)
Day.of.game$Text <-gsub("Fri.","5) Friday",Day.of.game$Text)
Day.of.game$Text <-gsub("Sat.","6) Saturday",Day.of.game$Text)
Day.of.game$Text <-gsub("Sun.","7) Sunday",Day.of.game$Text)
#================================
When.Attend$Text <-gsub("More than 2 months ago","1) More than 2 months ago",When.Attend$Text)
When.Attend$Text <-gsub("1-2 months ago","2) 1-2 months ago",When.Attend$Text)
When.Attend$Text <-gsub("2-4 weeks ago","3) 2-4 weeks ago",When.Attend$Text)
When.Attend$Text <-gsub("Over a week ago","4) Over a week ago",When.Attend$Text)
When.Attend$Text <-gsub("Within the past week","5) Within the past week",When.Attend$Text)
When.Attend$Text <-gsub("The day before the game","6) The day before the game",When.Attend$Text)
When.Attend$Text <-gsub("The day of the game","7) The day of the game",When.Attend$Text)
#================================
Attendance <- data.frame(Day.of.game,
                         Month.of.game,
                         When.Attend, 
                         stringsAsFactors=FALSE)
names(Attendance)[1] <- "Day of Game"
names(Attendance)[2] <- "Month of Game"
names(Attendance)[3] <- "Planned on Attending"
rm(Day.of.game, When.Attend, Month.of.game)
#================================
library(MASS)
library(plotrix)
library(ggplot2)
#================================
Attendance_day_chart = Attendance$"Day of Game"
Attendance_day_chart.freq = table(Attendance_day_chart)
#================================
Attendance_planned_chart = Attendance$"Planned on Attending"
Attendance_planned_chart.freq = table(Attendance_planned_chart)
#================================
Attendance_day_chart.freq <-as.data.frame(Attendance_day_chart.freq)
Attendance_planned_chart.freq <-as.data.frame(Attendance_planned_chart.freq)
#================================
rm(Attendance_day_chart,Attendance_planned_chart)
#================================
#SAL_labels <-  round(Attendance_day_chart.freq$Freq/sum(Attendance_day_chart.freq$Freq) * 100, 1)
#SAL_labels <- paste(SAL_labels,"%")
#PIE.CHART.DAY.ATTEND <- pie(Attendance_day_chart.freq$Freq, main="Day Attended Game", labels=SAL_labels, col=rainbow(7))
#legend("topright", c("Monday","Tuesday","Wednesday","Thursday","Friday","Saturday","Sunday"), cex=0.8, fill=rainbow(7))
#================================
#SAL_labels <-  round(Attendance_planned_chart.freq$Freq/sum(Attendance_planned_chart.freq$Freq) * 100, 1)
#SAL_labels <- paste(SAL_labels,"%")
#PIE.CHART.PLAN.ATTEND <- pie(Attendance_planned_chart.freq$Freq, main="Planned to Attend Game", labels=SAL_labels, col=rainbow(7))
#legend("topright", c("2+ months ago", "1-2 months ago", "2-4 weeks ago", "Over a week ago", "Within the past week", "Day before the game", "Day of the game"), cex=0.8, fill=rainbow(7))
#================================
write.csv(Attendance, file = "Attendance.csv",row.names=FALSE)
#================================
Decision_Factor1 <- Search.text1[c(5:14)]
Decision_Factor2 <- Search.text2[c(5:14)]
Decision_Factor3 <- Search.text3[c(5:14)]
Decision_Factor4 <- Search.text4[c(5:14)]
Decision_Factor5 <- Search.text5[c(5:14)]
Decision_Factor6 <- Search.text6[c(5:14)]
#================================
names(Decision_Factor1)[1] <- "Opponent"
names(Decision_Factor2)[1] <- "Opponent"
names(Decision_Factor3)[1] <- "Opponent"
names(Decision_Factor4)[1] <- "Opponent"
names(Decision_Factor5)[1] <- "Opponent"
names(Decision_Factor6)[1] <- "Opponent"
#================================
names(Decision_Factor1)[2] <- "Pitching"
names(Decision_Factor2)[2] <- "Pitching"
names(Decision_Factor3)[2] <- "Pitching"
names(Decision_Factor4)[2] <- "Pitching"
names(Decision_Factor5)[2] <- "Pitching"
names(Decision_Factor6)[2] <- "Pitching"
#================================
names(Decision_Factor1)[3] <- "Weekend or Weekday"
names(Decision_Factor2)[3] <- "Weekend or Weekday"
names(Decision_Factor3)[3] <- "Weekend or Weekday"
names(Decision_Factor4)[3] <- "Weekend or Weekday"
names(Decision_Factor5)[3] <- "Weekend or Weekday"
names(Decision_Factor6)[3] <- "Weekend or Weekday"
#================================
names(Decision_Factor1)[4] <- "Seating Selection"
names(Decision_Factor2)[4] <- "Seating Selection"
names(Decision_Factor3)[4] <- "Seating Selection"
names(Decision_Factor4)[4] <- "Seating Selection"
names(Decision_Factor5)[4] <- "Seating Selection"
names(Decision_Factor6)[4] <- "Seating Selection"
#================================
names(Decision_Factor1)[5] <- "Weather"
names(Decision_Factor2)[5] <- "Weather"
names(Decision_Factor3)[5] <- "Weather"
names(Decision_Factor4)[5] <- "Weather"
names(Decision_Factor5)[5] <- "Weather"
names(Decision_Factor6)[5] <- "Weather"
#================================
names(Decision_Factor1)[6] <- "Parking"
names(Decision_Factor2)[6] <- "Parking"
names(Decision_Factor3)[6] <- "Parking"
names(Decision_Factor4)[6] <- "Parking"
names(Decision_Factor5)[6] <- "Parking"
names(Decision_Factor6)[6] <- "Parking"
#================================
names(Decision_Factor1)[7] <- "Ticket Bundle"
names(Decision_Factor2)[7] <- "Ticket Bundle"
names(Decision_Factor3)[7] <- "Ticket Bundle"
names(Decision_Factor4)[7] <- "Ticket Bundle"
names(Decision_Factor5)[7] <- "Ticket Bundle"
names(Decision_Factor6)[7] <- "Ticket Bundle"
#================================
names(Decision_Factor1)[8] <- "Ticket Price"
names(Decision_Factor2)[8] <- "Ticket Price"
names(Decision_Factor3)[8] <- "Ticket Price"
names(Decision_Factor4)[8] <- "Ticket Price"
names(Decision_Factor5)[8] <- "Ticket Price"
names(Decision_Factor6)[8] <- "Ticket Price"
#================================
names(Decision_Factor1)[9] <- "Start Time"
names(Decision_Factor2)[9] <- "Start Time"
names(Decision_Factor3)[9] <- "Start Time"
names(Decision_Factor4)[9] <- "Start Time"
names(Decision_Factor5)[9] <- "Start Time"
names(Decision_Factor6)[9] <- "Start Time"
#================================
names(Decision_Factor1)[10] <- "None of the above"
names(Decision_Factor2)[10] <- "None of the above"
names(Decision_Factor3)[10] <- "None of the above"
names(Decision_Factor4)[10] <- "None of the above"
names(Decision_Factor5)[10] <- "None of the above"
names(Decision_Factor6)[10] <- "None of the above"
#================================
Decision_Factor1 <-as.data.frame(Decision_Factor1)
Decision_Factor2 <-as.data.frame(Decision_Factor2)
Decision_Factor3 <-as.data.frame(Decision_Factor3)
Decision_Factor4 <-as.data.frame(Decision_Factor4)
Decision_Factor5 <-as.data.frame(Decision_Factor5)
Decision_Factor6 <-as.data.frame(Decision_Factor6)
#================================
Decision_Factor <-rbind(Decision_Factor1, Decision_Factor2, Decision_Factor3, Decision_Factor4, Decision_Factor5, Decision_Factor6)

rm(Decision_Factor1, Decision_Factor2, Decision_Factor3, Decision_Factor4, Decision_Factor5, Decision_Factor6)
#================================
Decision_Factor$"Opponent" <-gsub("Opponent",1,Decision_Factor$"Opponent")
Decision_Factor$"Pitching" <-gsub("Pitching match-up",1,Decision_Factor$"Pitching")
Decision_Factor$"Weekend or Weekday" <-gsub("Weekend vs. Weekday",1,Decision_Factor$"Weekend or Weekday")
Decision_Factor$"Seating Selection" <-gsub("Seating selection/availability",1,Decision_Factor$"Seating Selection")
Decision_Factor$"Weather" <-gsub("Weather",1,Decision_Factor$"Weather")
Decision_Factor$"Parking" <-gsub("Parking Availability",1,Decision_Factor$"Parking")
Decision_Factor$"Ticket Price" <-gsub("Ticket price",1,Decision_Factor$"Ticket Price")
Decision_Factor$"None of the above" <-gsub("None of the above",1,Decision_Factor$"None of the above")
Decision_Factor$"Start Time" <-gsub("\\s*\\([^\\)]+\\)","",as.character(Decision_Factor$"Start Time"))
Decision_Factor$"Start Time" <-gsub("Start time",1,Decision_Factor$"Start Time")
Decision_Factor$"Ticket Bundle" <-gsub("\\s*\\([^\\)]+\\)","",as.character(Decision_Factor$"Ticket Bundle"))
Decision_Factor$"Ticket Bundle" <-gsub("Ticket bundle",1,Decision_Factor$"Ticket Bundle")
#================================
Decision_Factor$"Opponent" <-gsub("-",0,Decision_Factor$"Opponent")
Decision_Factor$"Pitching" <-gsub("-",0,Decision_Factor$"Pitching")
Decision_Factor$"Weekend or Weekday" <-gsub("-",0,Decision_Factor$"Weekend or Weekday")
Decision_Factor$"Seating Selection" <-gsub("-",0,Decision_Factor$"Seating Selection")
Decision_Factor$"Weather" <-gsub("-",0,Decision_Factor$"Weather")
Decision_Factor$"Parking" <-gsub("-",0,Decision_Factor$"Parking")
Decision_Factor$"Ticket Price" <-gsub("-",0,Decision_Factor$"Ticket Price")
Decision_Factor$"None of the above" <-gsub("-",0,Decision_Factor$"None of the above")
Decision_Factor$"Start Time" <-gsub("-",0,Decision_Factor$"Start Time")
Decision_Factor$"Ticket Bundle" <-gsub("-",0,Decision_Factor$"Ticket Bundle")
#================================
Decision_Factor$"Opponent" <-as.numeric(Decision_Factor$"Opponent")
Decision_Factor$"Pitching" <-as.numeric(Decision_Factor$"Pitching")
Decision_Factor$"Weekend or Weekday" <-as.numeric(Decision_Factor$"Weekend or Weekday")
Decision_Factor$"Seating Selection" <-as.numeric(Decision_Factor$"Seating Selection")
Decision_Factor$"Weather" <-as.numeric(Decision_Factor$"Weather")
Decision_Factor$"Parking" <-as.numeric(Decision_Factor$"Parking")
Decision_Factor$"Ticket Price" <-as.numeric(Decision_Factor$"Ticket Price")
Decision_Factor$"None of the above" <-as.numeric(Decision_Factor$"None of the above")
Decision_Factor$"Start Time" <-as.numeric(Decision_Factor$"Start Time")
Decision_Factor$"Ticket Bundle" <-as.numeric(Decision_Factor$"Ticket Bundle")
#================================
Decision_Factor.numbers <-Decision_Factor
Decision_Factor.numbers[is.na(Decision_Factor.numbers)] <- 0
Decision_Totals <-as.data.frame(colSums (Decision_Factor.numbers, na.rm = FALSE, dims = 1))
rm(Decision_Factor.numbers)
write.csv(Decision_Factor, file = "Decision factor.csv",row.names=TRUE)

Decision_Factor <-read.csv("Decision factor.csv")
Decision_Factor$ID <-Decision_Factor$X+0
Decision_Factor$ID <-as.numeric(Decision_Factor$ID)
Decision_Factor$X <-NULL

Decision_Factor2<- Decision_Factor[ which(Decision_Factor$Opponent!=""), ]
Decision_Factor$MATCH_ID <- Decision_Factor$ID %in% Decision_Factor2$ID
Decision_Factor2<- Decision_Factor[ which(Decision_Factor$MATCH_ID=="TRUE"), ]
Decision_Factor1<- Decision_Factor[ which(Decision_Factor$MATCH_ID=="FALSE"), ]

Decision_Factor1$Opponent<-"NA"
Decision_Factor1$Pitching<-"NA"
Decision_Factor1$Weekend.or.Weekday<-"NA"
Decision_Factor1$Seating.Selection<-"NA"
Decision_Factor1$Weather<-"NA"
Decision_Factor1$Parking<-"NA"
Decision_Factor1$Ticket.Bundle<-"NA"
Decision_Factor1$Ticket.Price<-"NA"
Decision_Factor1$Start.Time<-"NA"
Decision_Factor1$None.of.the.above<-"NA"

Decision_Factor$MATCH_ID <-NULL
Decision_Factor1$MATCH_ID <-NULL
Decision_Factor2$MATCH_ID <-NULL

Decision_FactorGG <-rbind(Decision_Factor1, Decision_Factor2)
rm(Decision_Factor1, Decision_Factor2)
Decision_FactorGG <- Decision_FactorGG[order(Decision_FactorGG$ID),]
Decision_Factor<-Decision_FactorGG
rm(Decision_FactorGG)
Decision_Factor$ID <-NULL
write.csv(Decision_Factor, file = "Decision factor.csv",row.names=FALSE)

#================================
names(Decision_Totals)[1] <- "Totals"
#barplot(Decision_Totals$Totals, main="Count of Decision Factors", 
#        xlab="Decision Factors", names.arg = c("Opp", "Pitching", "Wkend/Wkdy", "Seat Select","Weather", "Parking","Ticket Bundle", "Ticket Price", "Start Time","None"))
#================================
Promotion1 <-Search.text1[c(15:25)]
Promotion2 <-Search.text2[c(15:24)]
Promotion3 <-Search.text3[c(15:25)]
Promotion4 <-Search.text4[c(15:25)]
Promotion5 <-Search.text5[c(15:29)]
Promotion6 <-Search.text6[c(15:29)]
#================================
names(Promotion1)[1] <- "April 6:Opening Day Ceremonies"
names(Promotion1)[2] <- "April 6: 10th Year Anniversary Commemorative Tin"
names(Promotion1)[3] <- "April 8: Rally Towel"
names(Promotion1)[4] <- "April 16: Black Heritage"
names(Promotion1)[5] <- "April 17: Military Appreciation Day"
names(Promotion1)[6] <- "April 18: Pups in the Park"
names(Promotion1)[7] <- "April 19:Kids Opening Day"
names(Promotion1)[8] <- "April 19: Kids Run the bases"
names(Promotion1)[9] <- "April 19: Signature Sundays"
names(Promotion1)[10] <- "April 19: Screech's B'day"
names(Promotion1)[11] <- "April 21: 10th Year Anniversary Stationary Set"
#================================
names(Promotion2)[1] <- "May 4: Livan Hernandez Bobblehead"
names(Promotion2)[2] <- "May 5: 10th Year Anniversary Bottle Stopper"
names(Promotion2)[3] <- "May 8: Navy Day"
names(Promotion2)[4] <- "May 9: Anniversary Day / Frank Rob"
names(Promotion2)[5] <- "May 19: Tote Bag"
names(Promotion2)[6] <- "May 23: Patriotic Series- Women in Military"
names(Promotion2)[7] <- "May 24: 10th Year Anniversary Poster"
names(Promotion2)[8] <- "June 1: Army Day"
names(Promotion2)[9] <- "June 2: 10th Year Anniversary Commemorative Coin"
names(Promotion2)[10] <- "June 4: Ryan Zimmerman Bobblehead"
#================================
names(Promotion3)[1] <- "June 18: Ladies Night"
names(Promotion3)[2] <- "June 19: Pilsner Cup"
names(Promotion3)[3] <- "June 20: Seniors Stroll the Bases"
names(Promotion3)[4] <- "June 21: Father's Day"
names(Promotion3)[5] <- "June 21: Pups in the Park"
names(Promotion3)[6] <- "June 24: College Rivalry Day"
names(Promotion3)[7] <- "July 3: Freedom Fireworks"
names(Promotion3)[8] <- "July 4: Patriotic Series"
names(Promotion3)[9] <- "July 5: Stephen Strasburg Bobblehead"
names(Promotion3)[10] <- "July 6: Social Fan Event"
names(Promotion3)[11] <- "July 7: 10th Year Anniversary Lapel Pin"
#================================
names(Promotion4)[1] <- "July 18: Scout Day"
names(Promotion4)[2] <- "July 19: Star Wars Day"
names(Promotion4)[3] <- "July 21: Marine Corp Day"
names(Promotion4)[4] <- "July 22: Camp Day"
names(Promotion4)[5] <- "August 3: Dollar Dog Night"
names(Promotion4)[6] <- "August 4: 10th Year Anniversary Replica Ticket"
names(Promotion4)[7] <- "August 5: Jayson Werth Chia Pet"
names(Promotion4)[8] <- "August 6: Coast Guard Day"
names(Promotion4)[9] <- "August 7: Freedom Fireworks"
names(Promotion4)[10] <- "August 8: Food Drive"
names(Promotion4)[11] <- "August 9: Food Drive"
#================================
names(Promotion5)[1] <- "August 21: Miller Lite Cap"
names(Promotion5)[2] <- "August 22: United Airlines Phone Charger"
names(Promotion5)[3] <- "August 25: Anthony Rendon Garden Gnome"
names(Promotion5)[4] <- "August 26: $1 Ice Cream"
names(Promotion5)[5] <- "August 26: Social Fan Event"
names(Promotion5)[6] <- "August 27: Pet Calendar Day"
names(Promotion5)[7] <- "August 28: American University T-Shirt"
names(Promotion5)[8] <- "August 29: 80's Night"
names(Promotion5)[9] <- "August 30: Jayson Werth Bobblehead"
names(Promotion5)[10] <- "August 30: School Supply Drive"
names(Promotion5)[11] <- "September 3: Nesting Doll"
names(Promotion5)[12] <- "September 3: Pups in the Park"
names(Promotion5)[13] <- "September 5: T-Mobile Earbuds"
names(Promotion5)[14] <- "September 6: Kids run the show"
names(Promotion5)[15] <- "September 6: Champions Day"
#================================
names(Promotion6)[1] <- "September 8: Mini Lineup Card"
names(Promotion6)[2] <- "September 9: Heroes Day"
names(Promotion6)[3] <- "September 9: $1 Hot Dogs"
names(Promotion6)[4] <- "September 17: Hispanic Heritage Day"
names(Promotion6)[5] <- "September 18: U.S. Air Force Day"
names(Promotion6)[6] <- "September 19: Faith Day"
names(Promotion6)[7] <- "September 20: Kids Run the Bases"
names(Promotion6)[8] <- "September 20: Scout Day"
names(Promotion6)[9] <- "September 21: Calvin Coolidge Bobblehead"
names(Promotion6)[10] <- "September 25: Jordan Zimmermann Bobblehad"
names(Promotion6)[11] <- "September 25: DECA Day"
names(Promotion6)[12] <- "September 26: Pups in the Park"
names(Promotion6)[13] <- "September 27: FANtastic FANale"
names(Promotion6)[14] <- "September 27: Kids Run the Bases"
names(Promotion6)[15] <- "September 27: Yoga in the Outfield"

#================================
write.csv(Promotion1, file = "Promotion1.csv",row.names=FALSE)
write.csv(Promotion2, file = "Promotion2.csv",row.names=FALSE)
write.csv(Promotion3, file = "Promotion3.csv",row.names=FALSE)
write.csv(Promotion4, file = "Promotion4.csv",row.names=FALSE)
write.csv(Promotion5, file = "Promotion5.csv",row.names=FALSE)
write.csv(Promotion6, file = "Promotion6.csv",row.names=FALSE)
#================================
Attend.Other.Games1 <-Search.text1[c(26)]
Attend.Other.Games2 <-Search.text2[c(25)]
Attend.Other.Games3 <-Search.text3[c(26)]
Attend.Other.Games4 <-Search.text4[c(26)]
Attend.Other.Games5 <-Search.text5[c(30)]
Attend.Other.Games6 <-Search.text6[c(30)]
#================================

Attend.Other.Games <-rbind(Attend.Other.Games1, Attend.Other.Games2, Attend.Other.Games3,Attend.Other.Games4, Attend.Other.Games5, Attend.Other.Games6)
rm(Attend.Other.Games1, Attend.Other.Games2, Attend.Other.Games3,Attend.Other.Games4, Attend.Other.Games5,Attend.Other.Games6)

names(Attend.Other.Games)[1] <- "Text"
#================================
write.csv(Attend.Other.Games, file = "To Attend Future Games.csv",row.names=TRUE)
Attend.Other.Games <-read.csv("To Attend Future Games.csv")
Attend.Other.Games$ID <-Attend.Other.Games$X+0
Attend.Other.Games$ID <-as.numeric(Attend.Other.Games$ID)
Attend.Other.Games$X <-NULL

Attend.Other.Games2<- Attend.Other.Games[ which(Attend.Other.Games$Text!=""), ]
Attend.Other.Games$MATCH_ID <- Attend.Other.Games$ID %in% Attend.Other.Games2$ID
Attend.Other.Games2<- Attend.Other.Games[ which(Attend.Other.Games$MATCH_ID=="TRUE"), ]
Attend.Other.Games1<- Attend.Other.Games[ which(Attend.Other.Games$MATCH_ID=="FALSE"), ]

Attend.Other.Games$MATCH_ID <-NULL
Attend.Other.Games1$MATCH_ID <-NULL
Attend.Other.Games2$MATCH_ID <-NULL

Attend.Other.Games1$Text<-"NA"

Attend.Other.GamesGG <-rbind(Attend.Other.Games1, Attend.Other.Games2)
rm(Attend.Other.Games1, Attend.Other.Games2)
Attend.Other.GamesGG <- Attend.Other.GamesGG[order(Attend.Other.GamesGG$ID),]
Attend.Other.Games<-Attend.Other.GamesGG
rm(Attend.Other.GamesGG)
Attend.Other.Games$ID <-NULL
names(Attend.Other.Games)[1] <- "Attend Future games"
write.csv(Attend.Other.Games, file = "To Attend Future Games.csv",row.names=FALSE)

#================================
Consider.Season.Plan1 <-Search.text1[c(30)]
Consider.Season.Plan2 <-Search.text2[c(29)]
Consider.Season.Plan3 <-Search.text3[c(30)]
Consider.Season.Plan4 <-Search.text4[c(30)]
Consider.Season.Plan5 <-Search.text5[c(34)]
Consider.Season.Plan6 <-Search.text6[c(34)]
#================================
Consider.Season.Plan <-rbind(Consider.Season.Plan1, Consider.Season.Plan2, Consider.Season.Plan3, Consider.Season.Plan4, Consider.Season.Plan5, Consider.Season.Plan6)
rm(Consider.Season.Plan1, Consider.Season.Plan2, Consider.Season.Plan3, Consider.Season.Plan4,Consider.Season.Plan5, Consider.Season.Plan6)
names(Consider.Season.Plan)[1] <- "Text"
#================================
write.csv(Consider.Season.Plan, "Consider Season Plan.csv", row.names=TRUE)
Consider.Season.Plan <-read.csv("Consider Season Plan.csv")
Consider.Season.Plan$ID <-Consider.Season.Plan$X+0
Consider.Season.Plan$ID <-as.numeric(Consider.Season.Plan$ID)
Consider.Season.Plan$X <-NULL

Consider.Season.Plan1<- Consider.Season.Plan[ which(Consider.Season.Plan$Text==""), ]
Consider.Season.Plan2<- Consider.Season.Plan[ which(Consider.Season.Plan$Text!=""), ]
Consider.Season.Plan1$Text <-"NA"
Consider.Season.Plan.GG <-rbind(Consider.Season.Plan1, Consider.Season.Plan2)
rm(Consider.Season.Plan1, Consider.Season.Plan2)
Consider.Season.Plan.GG <- Consider.Season.Plan.GG[order(Consider.Season.Plan.GG$ID),]
Consider.Season.Plan<-Consider.Season.Plan.GG
rm(Consider.Season.Plan.GG)
Consider.Season.Plan$ID <-NULL
names(Consider.Season.Plan)[1] <- "Consider Season Plan"
write.csv(Consider.Season.Plan, "Consider Season Plan.csv", row.names=FALSE)
#================================
Reason.No.Season.Plan1 <-Search.text1[c(31:44)]
Reason.No.Season.Plan2 <-Search.text2[c(30:43)]
Reason.No.Season.Plan3 <-Search.text3[c(31:44)]
Reason.No.Season.Plan4 <-Search.text4[c(31:44)]
Reason.No.Season.Plan5 <-Search.text5[c(35:48)]
Reason.No.Season.Plan6 <-Search.text6[c(35:48)]
#================================
Reason.No.Season.Plan <-rbind(Reason.No.Season.Plan1, Reason.No.Season.Plan2, Reason.No.Season.Plan3, Reason.No.Season.Plan4, Reason.No.Season.Plan5, Reason.No.Season.Plan6)
rm(Reason.No.Season.Plan1, Reason.No.Season.Plan2, Reason.No.Season.Plan3, Reason.No.Season.Plan4, Reason.No.Season.Plan5, Reason.No.Season.Plan6)
#================================
names(Reason.No.Season.Plan)[1] <- "Can Not Afford"
names(Reason.No.Season.Plan)[2] <- "Too Many Games"
names(Reason.No.Season.Plan)[3] <- "Too Far"
names(Reason.No.Season.Plan)[4] <- "Not Enough Parking"
names(Reason.No.Season.Plan)[5] <- "Poor Internet"
names(Reason.No.Season.Plan)[6] <- "Prefer to watch on TV"
names(Reason.No.Season.Plan)[7] <- "Personal Schedule"
names(Reason.No.Season.Plan)[8] <- "Not happy with Concessions"
names(Reason.No.Season.Plan)[9] <- "Weak Ticket Benefits"
names(Reason.No.Season.Plan)[10] <- "Can get tickets from friends"
names(Reason.No.Season.Plan)[11] <- "Can easily purchase single game tickets"
names(Reason.No.Season.Plan)[12] <- "Other"
names(Reason.No.Season.Plan)[13] <- "None of the Above"
names(Reason.No.Season.Plan)[14] <- "Other Specifically"
#================================
Reason.No.Season.Plan$"Can Not Afford" <-gsub("I cannot afford a Season Ticket Plan",1,Reason.No.Season.Plan$"Can Not Afford")
Reason.No.Season.Plan$"Too Many Games" <-gsub("Too many games to commit to",1,Reason.No.Season.Plan$"Too Many Games")
Reason.No.Season.Plan$"Too Far" <-gsub("Too far to travel to the ballpark",1,Reason.No.Season.Plan$"Too Far")
Reason.No.Season.Plan$"Not Enough Parking" <-gsub("Not enough available parking",1,Reason.No.Season.Plan$"Not Enough Parking")
Reason.No.Season.Plan$"Poor Internet" <-gsub("Poor internet connectivity at the ballpark",1,Reason.No.Season.Plan$"Poor Internet")
Reason.No.Season.Plan$"Prefer to watch on TV" <-gsub("Prefer to watch games on TV at home",1,Reason.No.Season.Plan$"Prefer to watch on TV")
Reason.No.Season.Plan$"Personal Schedule" <-gsub("Personal schedule is too busy",1,Reason.No.Season.Plan$"Personal Schedule")
Reason.No.Season.Plan$"Not happy with Concessions" <-gsub("Dissatisfaction with concessions",1,Reason.No.Season.Plan$"Not happy with Concessions")
Reason.No.Season.Plan$"Weak Ticket Benefits" <-gsub("Ticket plan benefits not attractive enough",1,Reason.No.Season.Plan$"Weak Ticket Benefits")
Reason.No.Season.Plan$"Can get tickets from friends" <-gsub("Can easily get tickets from friends/family/colleagues",1,Reason.No.Season.Plan$"Can get tickets from friends")
Reason.No.Season.Plan$"Can easily purchase single game tickets" <-gsub("Can easily purchase single game tickets",1,Reason.No.Season.Plan$"Can easily purchase single game tickets")
Reason.No.Season.Plan$"Other" <-gsub("Other",1,Reason.No.Season.Plan$"Other")
Reason.No.Season.Plan$"None of the Above" <-gsub("None of the Above",1,Reason.No.Season.Plan$"None of the Above")
#================================
Reason.No.Season.Plan$"Can Not Afford" <-gsub("-",0,Reason.No.Season.Plan$"Can Not Afford")
Reason.No.Season.Plan$"Too Many Games" <-gsub("-",0,Reason.No.Season.Plan$"Too Many Games")
Reason.No.Season.Plan$"Too Far" <-gsub("-",0,Reason.No.Season.Plan$"Too Far")
Reason.No.Season.Plan$"Not Enough Parking" <-gsub("-",0,Reason.No.Season.Plan$"Not Enough Parking")
Reason.No.Season.Plan$"Poor Internet" <-gsub("-",0,Reason.No.Season.Plan$"Poor Internet")
Reason.No.Season.Plan$"Prefer to watch on TV" <-gsub("-",0,Reason.No.Season.Plan$"Prefer to watch on TV")
Reason.No.Season.Plan$"Personal Schedule" <-gsub("-",0,Reason.No.Season.Plan$"Personal Schedule")
Reason.No.Season.Plan$"Not happy with Concessions" <-gsub("-",0,Reason.No.Season.Plan$"Not happy with Concessions")
Reason.No.Season.Plan$"Weak Ticket Benefits" <-gsub("-",0,Reason.No.Season.Plan$"Weak Ticket Benefits")
Reason.No.Season.Plan$"Can get tickets from friends" <-gsub("-",0,Reason.No.Season.Plan$"Can get tickets from friends")
Reason.No.Season.Plan$"Can easily purchase single game tickets" <-gsub("-",0,Reason.No.Season.Plan$"Can easily purchase single game tickets")
Reason.No.Season.Plan$"Other" <-gsub("-",0,Reason.No.Season.Plan$"Other")
Reason.No.Season.Plan$"None of the Above" <-gsub("-",0,Reason.No.Season.Plan$"None of the Above")
#================================
write.csv(Reason.No.Season.Plan, file = "Against Season Plan.csv",row.names=TRUE)

Reason.No.Season.Plan <-read.csv("Against Season Plan.csv")
Reason.No.Season.Plan$ID <-Reason.No.Season.Plan$X+0
Reason.No.Season.Plan$ID <-as.numeric(Reason.No.Season.Plan$ID)
Reason.No.Season.Plan$X <-NULL

Reason.No.Season.Plan2<- Reason.No.Season.Plan[ which(Reason.No.Season.Plan$Can.Not.Afford!=""), ]
Reason.No.Season.Plan$MATCH_ID <- Reason.No.Season.Plan$ID %in% Reason.No.Season.Plan2$ID
Reason.No.Season.Plan2<- Reason.No.Season.Plan[ which(Reason.No.Season.Plan$MATCH_ID=="TRUE"), ]
Reason.No.Season.Plan1<- Reason.No.Season.Plan[ which(Reason.No.Season.Plan$MATCH_ID=="FALSE"), ]

Reason.No.Season.Plan$MATCH_ID <-NULL
Reason.No.Season.Plan1$MATCH_ID <-NULL
Reason.No.Season.Plan2$MATCH_ID <-NULL


Reason.No.Season.Plan1$Can.Not.Afford<-"NA"
Reason.No.Season.Plan1$Too.Many.Games<-"NA"
Reason.No.Season.Plan1$Too.Far<-"NA"
Reason.No.Season.Plan1$Not.Enough.Parking<-"NA"
Reason.No.Season.Plan1$Poor.Internet<-"NA"
Reason.No.Season.Plan1$Prefer.to.watch.on.TV<-"NA"
Reason.No.Season.Plan1$Personal.Schedule<-"NA"
Reason.No.Season.Plan1$Not.happy.with.Concessions<-"NA"
Reason.No.Season.Plan1$Weak.Ticket.Benefits<-"NA"
Reason.No.Season.Plan1$Can.get.tickets.from.friends<-"NA"
Reason.No.Season.Plan1$Can.easily.purchase.single.game.tickets<-"NA"
Reason.No.Season.Plan1$Other<-"NA"
Reason.No.Season.Plan1$None.of.the.Above<-"NA"
Reason.No.Season.Plan1$Other.Specifically<-"NA"

Reason.No.Season.PlanGG <-rbind(Reason.No.Season.Plan1, Reason.No.Season.Plan2)
rm(Reason.No.Season.Plan1, Reason.No.Season.Plan2)
Reason.No.Season.PlanGG <- Reason.No.Season.PlanGG[order(Reason.No.Season.PlanGG$ID),]
Reason.No.Season.Plan<-Reason.No.Season.PlanGG
rm(Reason.No.Season.PlanGG)
Reason.No.Season.Plan$ID <-NULL
write.csv(Reason.No.Season.Plan, file = "Against Season Plan.csv",row.names=FALSE)

Reason.No.Season.Plan.numbers <-Reason.No.Season.Plan
Reason.No.Season.Plan.numbers <- as.data.frame(Reason.No.Season.Plan.numbers[ which(Reason.No.Season.Plan.numbers$Too.Far!="NA"),])

Reason.No.Season.Plan.numbers$Can.Not.Afford <-as.numeric(Reason.No.Season.Plan.numbers$Can.Not.Afford)
Reason.No.Season.Plan.numbers$Too.Many.Games <-as.numeric(Reason.No.Season.Plan.numbers$Too.Many.Games)
Reason.No.Season.Plan.numbers$Too.Far <-as.numeric(Reason.No.Season.Plan.numbers$Too.Far)
Reason.No.Season.Plan.numbers$Not.Enough.Parking <-as.numeric(Reason.No.Season.Plan.numbers$Not.Enough.Parking)
Reason.No.Season.Plan.numbers$Poor.Internet <-as.numeric(Reason.No.Season.Plan.numbers$Poor.Internet)
Reason.No.Season.Plan.numbers$Prefer.to.watch.on.TV <-as.numeric(Reason.No.Season.Plan.numbers$Prefer.to.watch.on.TV)
Reason.No.Season.Plan.numbers$Personal.Schedule <-as.numeric(Reason.No.Season.Plan.numbers$Personal.Schedule)
Reason.No.Season.Plan.numbers$Not.happy.with.Concessions <-as.numeric(Reason.No.Season.Plan.numbers$Not.happy.with.Concessions)
Reason.No.Season.Plan.numbers$Weak.Ticket.Benefits <-as.numeric(Reason.No.Season.Plan.numbers$Weak.Ticket.Benefits)
Reason.No.Season.Plan.numbers$Can.get.tickets.from.friends <-as.numeric(Reason.No.Season.Plan.numbers$Can.get.tickets.from.friends)
Reason.No.Season.Plan.numbers$Can.easily.purchase.single.game.tickets <-as.numeric(Reason.No.Season.Plan.numbers$Can.easily.purchase.single.game.tickets)
Reason.No.Season.Plan.numbers$Other <-as.numeric(Reason.No.Season.Plan.numbers$Other)
Reason.No.Season.Plan.numbers$None.of.the.Above <-as.numeric(Reason.No.Season.Plan.numbers$None.of.the.Above)
Reason.No.Season.Plan.numbers$Other.Specifically <-NULL

Reason.No.Season.Plan_Totals <-as.data.frame(colSums (Reason.No.Season.Plan.numbers, na.rm = FALSE, dims = 1))
names(Reason.No.Season.Plan_Totals)[1] <- "Count"

write.csv(Reason.No.Season.Plan_Totals, "Reason.No.Season.Plan_Totals.csv",row.names=TRUE)
Reason.No.Season.Plan_Totals <-read.csv("Reason.No.Season.Plan_Totals.csv")
names(Reason.No.Season.Plan_Totals)[1] <- "Reason"
write.csv(Reason.No.Season.Plan_Totals, "Reason.No.Season.Plan_Totals.csv",row.names=FALSE)
#================================
Experience1 <-Search.text1[c(47)]
Experience2 <-Search.text2[c(46)]
Experience3 <-Search.text3[c(47)]
Experience4 <-Search.text4[c(47)]
Experience5 <-Search.text5[c(51)]
Experience6 <-Search.text6[c(51)]
#================================
names(Experience1)[1] <- "Text"
names(Experience2)[1] <- "Text"
names(Experience3)[1] <- "Text"
names(Experience4)[1] <- "Text"
names(Experience5)[1] <- "Text"
names(Experience6)[1] <- "Text"
#================================
Experience1 <- as.data.frame(Experience1[ which(Experience1$Text!=''),])
Experience2 <- as.data.frame(Experience2[ which(Experience2$Text!=''),])
Experience3 <- as.data.frame(Experience3[ which(Experience3$Text!=''),])
Experience4 <- as.data.frame(Experience4[ which(Experience4$Text!=''),])
Experience5 <- as.data.frame(Experience5[ which(Experience5$Text!=''),])
Experience6 <- as.data.frame(Experience6[ which(Experience6$Text!=''),])
#================================
names(Experience1)[1] <- "TEXT"
names(Experience2)[1] <- "TEXT"
names(Experience3)[1] <- "TEXT"
names(Experience4)[1] <- "TEXT"
names(Experience5)[1] <- "TEXT"
names(Experience6)[1] <- "TEXT"
#================================
library(xlsx)
write.xlsx(Experience1, file = "R:/Business Strategy_Analytics/Garrett Georgia/Survey Data/Bounceback Overall Data/Bounceback Emails/1SURVEY.xlsx",row.names=FALSE)
write.xlsx(Experience2, file = "R:/Business Strategy_Analytics/Garrett Georgia/Survey Data/Bounceback Overall Data/Bounceback Emails/2SURVEY.xlsx",row.names=FALSE)
write.xlsx(Experience3, file = "R:/Business Strategy_Analytics/Garrett Georgia/Survey Data/Bounceback Overall Data/Bounceback Emails/3SURVEY.xlsx",row.names=FALSE)
write.xlsx(Experience4, file = "R:/Business Strategy_Analytics/Garrett Georgia/Survey Data/Bounceback Overall Data/Bounceback Emails/4SURVEY.xlsx",row.names=FALSE)
write.xlsx(Experience5, file = "R:/Business Strategy_Analytics/Garrett Georgia/Survey Data/Bounceback Overall Data/Bounceback Emails/5SURVEY.xlsx",row.names=FALSE)
write.xlsx(Experience6, file = "R:/Business Strategy_Analytics/Garrett Georgia/Survey Data/Bounceback Overall Data/Bounceback Emails/6SURVEY.xlsx",row.names=FALSE)

#================================
Residency.Length1 <-Search.text1[c(45:46)]
Residency.Length2 <-Search.text2[c(44:45)]
Residency.Length3 <-Search.text3[c(45:46)]
Residency.Length4 <-Search.text4[c(45:46)]
Residency.Length5 <-Search.text5[c(49:50)]
Residency.Length6 <-Search.text6[c(49:50)]
#================================
names(Residency.Length1)[1] <- "Text1"
names(Residency.Length2)[1] <- "Text1"
names(Residency.Length3)[1] <- "Text1"
names(Residency.Length4)[1] <- "Text1"
names(Residency.Length5)[1] <- "Text1"
names(Residency.Length6)[1] <- "Text1"
#================================
names(Residency.Length1)[2] <- "Text2"
names(Residency.Length2)[2] <- "Text2"
names(Residency.Length3)[2] <- "Text2"
names(Residency.Length4)[2] <- "Text2"
names(Residency.Length5)[2] <- "Text2"
names(Residency.Length6)[2] <- "Text2"
#================================
Residency.Length <- rbind(Residency.Length1, Residency.Length2, Residency.Length3, Residency.Length4, Residency.Length5,Residency.Length6)
rm(Residency.Length1, Residency.Length2, Residency.Length3, Residency.Length4, Residency.Length5, Residency.Length6)
#================================
write.csv(Residency.Length, file = "Length of Residence.csv",row.names=TRUE)

Residency.Length <-read.csv("Length of Residence.csv")
Residency.Length$ID <-Residency.Length$X+0
Residency.Length$ID <-as.numeric(Residency.Length$ID)
Residency.Length$X <-NULL

Residency.Length2<- Residency.Length[ which(Residency.Length$Text1!=""), ]
Residency.Length$MATCH_ID <- Residency.Length$ID %in% Residency.Length2$ID
Residency.Length2<- Residency.Length[ which(Residency.Length$MATCH_ID=="TRUE"), ]
Residency.Length1<- Residency.Length[ which(Residency.Length$MATCH_ID=="FALSE"), ]

Residency.Length$MATCH_ID <-NULL
Residency.Length1$MATCH_ID <-NULL
Residency.Length2$MATCH_ID <-NULL

Residency.Length1$Text1<-"NA"
Residency.Length1$Text2<-"NA"

Residency.LengthGG <-rbind(Residency.Length1, Residency.Length2)
rm(Residency.Length1, Residency.Length2)
Residency.LengthGG <- Residency.LengthGG[order(Residency.LengthGG$ID),]
Residency.Length<-Residency.LengthGG
rm(Residency.LengthGG)
Residency.Length$ID <-NULL
names(Residency.Length)[1] <- "Age Range"
names(Residency.Length)[2] <- "Residency Length"
write.csv(Attend.Other.Games, file = "Length of Residence.csv",row.names=FALSE)
#================================
library(gdata)

BBSURVEYSTEP1MERGE <-cbindX(data.frame(Attendance),data.frame(Decision_Factor),data.frame(Attend.Other.Games), data.frame(Consider.Season.Plan), data.frame(Reason.No.Season.Plan), data.frame(Residency.Length))
write.csv(BBSURVEYSTEP1MERGE, file = "BBSURVEYSTEP1MERGE.csv",row.names=FALSE)

GGTEST <-BBSURVEYSTEP1MERGE

GGTEST <- GGTEST[c(1:13)]
GGTEST <- GGTEST[order(GGTEST$Planned.on.Attending),]

GGTEST<- GGTEST[ which(GGTEST$Opponent!="NA"), ]

####
Over.a.week <- GGTEST[ which(GGTEST$Planned.on.Attending=="4) Over a week ago"), ]
Two.four.weeks <- GGTEST[ which(GGTEST$Planned.on.Attending=="3) 2-4 weeks ago"), ]
One.two.Months <- GGTEST[ which(GGTEST$Planned.on.Attending=="2) 1-2 months ago"), ]
Day.of.the.game <- GGTEST[ which(GGTEST$Planned.on.Attending=="7) The day of the game"), ]
Day.before.the.game <- GGTEST[ which(GGTEST$Planned.on.Attending=="6) The day before the game"), ]
Within.past.week <- GGTEST[ which(GGTEST$Planned.on.Attending=="5) Within the past week"), ]
More.than.two.months <- GGTEST[ which(GGTEST$Planned.on.Attending=="1) More than 2 months ago"), ]
####

Over.a.week <- Over.a.week[c(4:13)]
write.csv(Over.a.week, "Over.a.week.csv", row.names = FALSE)
Over.a.week <- read.csv("Over.a.week.csv")
Over.a.week.totals <-as.data.frame(colSums (Over.a.week, na.rm = FALSE, dims = 1))
names(Over.a.week.totals)[1] <- "Text"
Over.a.week.totals$Text <-as.numeric(Over.a.week.totals$Text)
Over.a.week.totals$Over.a.week <-(Over.a.week.totals$Text)/nrow(Over.a.week)
Over.a.week.totals$Text <-NULL
rm(Over.a.week)

Two.four.weeks <- Two.four.weeks[c(4:13)]
write.csv(Two.four.weeks, "Two.four.weeks.csv", row.names = FALSE)
Two.four.weeks <- read.csv("Two.four.weeks.csv")
Two.four.weeks.totals <-as.data.frame(colSums (Two.four.weeks, na.rm = FALSE, dims = 1))
names(Two.four.weeks.totals)[1] <- "Text"
Two.four.weeks.totals$Text <-as.numeric(Two.four.weeks.totals$Text)
Two.four.weeks.totals$Two.four.weeks <-(Two.four.weeks.totals$Text)/nrow(Two.four.weeks)
Two.four.weeks.totals$Text <-NULL
rm(Two.four.weeks)

One.two.Months <- One.two.Months[c(4:13)]
write.csv(One.two.Months, "One.two.Months.csv", row.names = FALSE)
One.two.Months <- read.csv("One.two.Months.csv")
One.two.Months.totals <-as.data.frame(colSums (One.two.Months, na.rm = FALSE, dims = 1))
names(One.two.Months.totals)[1] <- "Text"
One.two.Months.totals$Text <-as.numeric(One.two.Months.totals$Text)
One.two.Months.totals$One.two.Months <-(One.two.Months.totals$Text)/nrow(One.two.Months)
One.two.Months.totals$Text <-NULL
rm(One.two.Months)

Day.of.the.game <- Day.of.the.game[c(4:13)]
write.csv(Day.of.the.game, "Day.of.the.game.csv", row.names = FALSE)
Day.of.the.game <- read.csv("Day.of.the.game.csv")
Day.of.the.game.totals <-as.data.frame(colSums (Day.of.the.game, na.rm = FALSE, dims = 1))
names(Day.of.the.game.totals)[1] <- "Text"
Day.of.the.game.totals$Text <-as.numeric(Day.of.the.game.totals$Text)
Day.of.the.game.totals$Day.of.the.game <-(Day.of.the.game.totals$Text)/nrow(Day.of.the.game)
Day.of.the.game.totals$Text <-NULL
rm(Day.of.the.game)

Day.before.the.game <- Day.before.the.game[c(4:13)]
write.csv(Day.before.the.game, "Day.before.the.game.csv", row.names = FALSE)
Day.before.the.game <- read.csv("Day.before.the.game.csv")
Day.before.the.game.totals <-as.data.frame(colSums (Day.before.the.game, na.rm = FALSE, dims = 1))
names(Day.before.the.game.totals)[1] <- "Text"
Day.before.the.game.totals$Text <-as.numeric(Day.before.the.game.totals$Text)
Day.before.the.game.totals$Day.before.the.game <-(Day.before.the.game.totals$Text)/nrow(Day.before.the.game)
Day.before.the.game.totals$Text <-NULL
rm(Day.before.the.game)

Within.past.week <- Within.past.week[c(4:13)]
write.csv(Within.past.week, "Within.past.week.csv", row.names = FALSE)
Within.past.week <- read.csv("Within.past.week.csv")
Within.past.week.totals <-as.data.frame(colSums (Within.past.week, na.rm = FALSE, dims = 1))
names(Within.past.week.totals)[1] <- "Text"
Within.past.week.totals$Text <-as.numeric(Within.past.week.totals$Text)
Within.past.week.totals$Within.past.week <-(Within.past.week.totals$Text)/nrow(Within.past.week)
Within.past.week.totals$Text <-NULL
rm(Within.past.week)

More.than.two.months <- More.than.two.months[c(4:13)]
write.csv(More.than.two.months, "More.than.two.months.csv", row.names = FALSE)
More.than.two.months <- read.csv("More.than.two.months.csv")
More.than.two.months.totals <-as.data.frame(colSums (More.than.two.months, na.rm = FALSE, dims = 1))
names(More.than.two.months.totals)[1] <- "Text"
More.than.two.months.totals$Text <-as.numeric(More.than.two.months.totals$Text)
More.than.two.months.totals$More.than.two.months <-(More.than.two.months.totals$Text)/nrow(More.than.two.months)
More.than.two.months.totals$Text <-NULL
rm(More.than.two.months)

Percent.Aggregate <-cbind(More.than.two.months.totals,One.two.Months.totals,Two.four.weeks.totals,Over.a.week.totals,Within.past.week.totals,Day.before.the.game.totals,Day.of.the.game.totals)
write.csv(Percent.Aggregate, "Percent.Aggregate.csv", row.names=TRUE)


