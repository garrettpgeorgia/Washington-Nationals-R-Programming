# Get Words
#DEPENDING ON THE FILE, DECIDE WHETHER I WANT TO CONVERT XLSX FILE AUTOMATICALLY TO ONE COLUMN WITH LABEL "TEXT"

library(xlsx)
setwd("R:/Business Strategy_Analytics/Garrett Georgia/Survey Data/Bounceback Overall Data/Bounceback Emails")
Search.text1 <- read.xlsx("1SURVEY.xlsx", sheetName='Sheet1',stringsAsFactors=FALSE)
Search.text2 <- read.xlsx("2SURVEY.xlsx", sheetName='Sheet1',stringsAsFactors=FALSE)
Search.text3 <- read.xlsx("3SURVEY.xlsx", sheetName='Sheet1',stringsAsFactors=FALSE)
Search.text4 <- read.xlsx("4SURVEY.xlsx", sheetName='Sheet1',stringsAsFactors=FALSE)
Search.text5 <- read.xlsx("5SURVEY.xlsx", sheetName='Sheet1',stringsAsFactors=FALSE)
Search.text6 <- read.xlsx("6SURVEY.xlsx", sheetName='Sheet1',stringsAsFactors=FALSE)

Search.text <- rbind(Search.text1, Search.text2, Search.text3, Search.text4, Search.text5, Search.text6)

rm(list=setdiff(ls(), "Search.text"))

# ==================================================================================
score.sentiment <- function(sentences, pos.words, neg.words, .progress='none')
{
  require(plyr)
  require(stringr)
  
  # we got a vector of sentences. plyr will handle a list
  # or a vector as an "l" for us
  # we want a simple array of scores back, so we use
  # "l" + "a" + "ply" = "laply":
  scores = laply(sentences, function(sentence, pos.words, neg.words) {
    
    # clean up sentences with R's regex-driven global substitute, gsub():
    sentence = gsub('[[:punct:]]', '', sentence)
    sentence = gsub('[[:cntrl:]]', '', sentence)
    sentence = gsub('\\d+', '', sentence)
    # and convert to lower case:
    sentence = tolower(sentence)
    
    # split into words. str_split is in the stringr package
    word.list = str_split(sentence, '\\s+')
    # sometimes a list() is one level of hierarchy too much
    words = unlist(word.list)
    
    # compare our words to the dictionaries of positive & negative terms
    pos.matches = match(words, pos.words)
    neg.matches = match(words, neg.words)
    
    # match() returns the position of the matched term or NA
    # we just want a TRUE/FALSE:
    pos.matches = !is.na(pos.matches)
    neg.matches = !is.na(neg.matches)
    
    # and conveniently enough, TRUE/FALSE will be treated as 1/0 by sum():
    score = sum(pos.matches) - sum(neg.matches)
    
    return(score)
  }, pos.words, neg.words, .progress=.progress )
  
  scores.df = data.frame(score=scores, text=sentences)
  return(scores.df)
}
# ===================================================================================
#Two lists
hu.liu.pos <- scan('R:/Business Strategy_Analytics/Garrett Georgia/R Code/Twitter/positive-words.txt', what='character', comment.char=';')
hu.liu.neg <- scan('R:/Business Strategy_Analytics/Garrett Georgia/R Code/Twitter/negative-words.txt', what='character', comment.char=';')

# Add List 1 with industry specific words
pos.words = c(hu.liu.pos)
neg.words = c(hu.liu.neg)
#====================================================================================
#AFINN
afinn_list <- read.delim(file='R:/Business Strategy_Analytics/Garrett Georgia/R Code/Twitter/AFINN-111.txt', header=FALSE, stringsAsFactors=FALSE)
names(afinn_list) <- c('word', 'score')
afinn_list$word <- tolower(afinn_list$word)

vNegTerms <- afinn_list$word[afinn_list$score==-5 | afinn_list$score==-4]
negTerms <- c(afinn_list$word[afinn_list$score==-3 | afinn_list$score==-2 | afinn_list$score==-1], "second-rate", "moronic", "third-rate", "flawed", "juvenile", "boring", "distasteful", "ordinary", "disgusting", "senseless", "static", "brutal", "confused", "disappointing", "bloody", "silly", "tired", "predictable", "stupid", "uninteresting", "trite", "uneven", "outdated", "dreadful", "bland")
posTerms <- c(afinn_list$word[afinn_list$score==3 | afinn_list$score==2 | afinn_list$score==1], "first-rate", "insightful", "clever", "charming", "comical", "charismatic", "enjoyable", "absorbing", "sensitive", "intriguing", "powerful", "pleasant", "surprising", "thought-provoking", "imaginative", "unpretentious")
vPosTerms <- c(afinn_list$word[afinn_list$score==5 | afinn_list$score==4], "uproarious", "riveting", "fascinating", "dazzling", "legendary", "5/5", "10/10")

#=======================================================================================

#Remove word 'game'
Search.text$TEXT = gsub("game", "", Search.text$TEXT)

#############
#SCORING
Search.scores = score.sentiment(Search.text$TEXT, pos.words, neg.words, .progress='text')

#APPEND SPECIAL CHARACTERS AND PHRASES
GG.SCORE<-subset(Search.scores, Search.scores$text !="A+")
GG.SCORE2<-subset(Search.scores, Search.scores$text =="A+")
GG.SCORE2$score<-1
Search.scores <- rbind(GG.SCORE, GG.SCORE2)

GG.SCORE<-subset(Search.scores, Search.scores$text !="A+++")
GG.SCORE2<-subset(Search.scores, Search.scores$text =="A+++")
GG.SCORE2$score<-1
Search.scores <- rbind(GG.SCORE, GG.SCORE2)

GG.SCORE<-subset(Search.scores, Search.scores$text !="A-")
GG.SCORE2<-subset(Search.scores, Search.scores$text =="A-")
GG.SCORE2$score<-1
Search.scores <- rbind(GG.SCORE, GG.SCORE2)

GG.SCORE<-subset(Search.scores, Search.scores$text !="A")
GG.SCORE2<-subset(Search.scores, Search.scores$text =="A")
GG.SCORE2$score<-1
Search.scores <- rbind(GG.SCORE, GG.SCORE2)

GG.SCORE<-subset(Search.scores, Search.scores$text !=":)")
GG.SCORE2<-subset(Search.scores, Search.scores$text ==":)")
GG.SCORE2$score<-1
Search.scores <- rbind(GG.SCORE, GG.SCORE2)

GG.SCORE<-subset(Search.scores, Search.scores$text !="Go, Nats!")
GG.SCORE2<-subset(Search.scores, Search.scores$text =="Go, Nats!")
GG.SCORE2$score<-1
Search.scores <- rbind(GG.SCORE, GG.SCORE2)

GG.SCORE<-subset(Search.scores, Search.scores$text !="Go Nats!")
GG.SCORE2<-subset(Search.scores, Search.scores$text =="Go Nats!")
GG.SCORE2$score<-1
Search.scores <- rbind(GG.SCORE, GG.SCORE2)

GG.SCORE<-subset(Search.scores, Search.scores$text !="10 out of 10")
GG.SCORE2<-subset(Search.scores, Search.scores$text =="10 out of 10")
GG.SCORE2$score<-1
Search.scores <- rbind(GG.SCORE, GG.SCORE2)

GG.SCORE<-subset(Search.scores, Search.scores$text !="8 out of 10")
GG.SCORE2<-subset(Search.scores, Search.scores$text =="8 out of 10")
GG.SCORE2$score<-1
Search.scores <- rbind(GG.SCORE, GG.SCORE2)

GG.SCORE<-subset(Search.scores, Search.scores$text !="9 out of 10")
GG.SCORE2<-subset(Search.scores, Search.scores$text =="9 out of 10")
GG.SCORE2$score<-1
Search.scores <- rbind(GG.SCORE, GG.SCORE2)

GG.SCORE<-subset(Search.scores, Search.scores$text !="5 stars")
GG.SCORE2<-subset(Search.scores, Search.scores$text =="5 stars")
GG.SCORE2$score<-1
Search.scores <- rbind(GG.SCORE, GG.SCORE2)

GG.SCORE<-subset(Search.scores, Search.scores$text !="8/10")
GG.SCORE2<-subset(Search.scores, Search.scores$text =="8/10")
GG.SCORE2$score<-1
Search.scores <- rbind(GG.SCORE, GG.SCORE2)

GG.SCORE<-subset(Search.scores, Search.scores$text !="9/10")
GG.SCORE2<-subset(Search.scores, Search.scores$text =="9/10")
GG.SCORE2$score<-1
Search.scores <- rbind(GG.SCORE, GG.SCORE2)

GG.SCORE<-subset(Search.scores, Search.scores$text !="10/10")
GG.SCORE2<-subset(Search.scores, Search.scores$text =="10/10")
GG.SCORE2$score<-1
Search.scores <- rbind(GG.SCORE, GG.SCORE2)

GG.SCORE<-subset(Search.scores, Search.scores$text !="2 thumbs up")
GG.SCORE2<-subset(Search.scores, Search.scores$text =="2 thumbs up")
GG.SCORE2$score<-1
Search.scores <- rbind(GG.SCORE, GG.SCORE2)

GG.SCORE<-subset(Search.scores, Search.scores$text !="5/5")
GG.SCORE2<-subset(Search.scores, Search.scores$text =="5/5")
GG.SCORE2$score<-1
Search.scores <- rbind(GG.SCORE, GG.SCORE2)

GG.SCORE<-subset(Search.scores, Search.scores$text !="8")
GG.SCORE2<-subset(Search.scores, Search.scores$text =="8")
GG.SCORE2$score<-1
Search.scores <- rbind(GG.SCORE, GG.SCORE2)

GG.SCORE<-subset(Search.scores, Search.scores$text !="9")
GG.SCORE2<-subset(Search.scores, Search.scores$text =="9")
GG.SCORE2$score<-1
Search.scores <- rbind(GG.SCORE, GG.SCORE2)

GG.SCORE<-subset(Search.scores, Search.scores$text !="10")
GG.SCORE2<-subset(Search.scores, Search.scores$text =="10")
GG.SCORE2$score<-1
Search.scores <- rbind(GG.SCORE, GG.SCORE2)

remove(GG.SCORE)
remove(GG.SCORE2)

######
#AFINN SCORING
#load up positive and negative sentences and format
surveyText <- Search.text$TEXT
surveyText <- unlist(lapply(surveyText, function(x) { str_split(x, "\n") }))

#function to calculate number of words in each category within a sentence
sentimentScore <- function(sentences, vNegTerms, negTerms, posTerms, vPosTerms){
  final_scores <- matrix('', 0, 5)
  scores <- laply(sentences, function(sentence, vNegTerms, negTerms, posTerms, vPosTerms){
    initial_sentence <- sentence
    #remove unnecessary characters and split up by word 
    sentence <- gsub('[[:punct:]]', '', sentence)
    sentence <- gsub('[[:cntrl:]]', '', sentence)
    sentence <- gsub('\\d+', '', sentence)
    sentence <- tolower(sentence)
    wordList <- str_split(sentence, '\\s+')
    words <- unlist(wordList)
    #build vector with matches between sentence and each category
    vPosMatches <- match(words, vPosTerms)
    posMatches <- match(words, posTerms)
    vNegMatches <- match(words, vNegTerms)
    negMatches <- match(words, negTerms)
    #sum up number of words in each category
    vPosMatches <- sum(!is.na(vPosMatches))
    posMatches <- sum(!is.na(posMatches))
    vNegMatches <- sum(!is.na(vNegMatches))
    negMatches <- sum(!is.na(negMatches))
    score <- c(vNegMatches, negMatches, posMatches, vPosMatches)
    #add row to scores table
    newrow <- c(initial_sentence, score)
    final_scores <- rbind(final_scores, newrow)
    return(final_scores)
  }, vNegTerms, negTerms, posTerms, vPosTerms)
  return(scores)
}

#build tables of positive and negative sentences with scores
surveyResult <- as.data.frame(sentimentScore(surveyText, vNegTerms, negTerms, posTerms, vPosTerms))
colnames(surveyResult) <- c('sentence', 'vNeg', 'neg', 'pos', 'vPos')
surveyResult <- surveyResult[!(surveyResult$sentence==""), ]


#Remove Factors
surveyResult$vNeg <- as.character(surveyResult$vNeg)
surveyResult$neg <- as.character(surveyResult$neg)
surveyResult$pos <- as.character(surveyResult$pos)
surveyResult$vPos <- as.character(surveyResult$vPos)
#Convert to Number
surveyResult$vNeg <- as.numeric(surveyResult$vNeg)
surveyResult$neg <- as.numeric(surveyResult$neg)
surveyResult$pos <- as.numeric(surveyResult$pos)
surveyResult$vPos <- as.numeric(surveyResult$vPos)

surveyResult$Sentiment = ((surveyResult$vNeg*-4) + (surveyResult$neg*-2) +(surveyResult$vPos*4) + (surveyResult$pos*2))
row.names(surveyResult) <- NULL


#===================================================================================
#BAR CHARTS
library(ggplot2)
#UNWEIGHTED
Counts <- table(Search.scores$score)
Counts
barplot(Counts, col="gray", main="Scoring Breakdown of Program 1",  xlab="Score", ylab="Count")

#WEIGHTED
Counts2 <- table(surveyResult$Sentiment)
Counts2
barplot(Counts2, col="gray", main="Scoring Breakdown of Program 2",  xlab="Score", ylab="Count")



#Distribution of Very Negative Remarks
Counts3 <- table(surveyResult$vNeg)
Counts3
barplot(Counts3, col="gray", main="Count of Very Negative Mentions",  xlab="Score", ylab="Count")

#Distribution of Negative Remarks
Counts4 <- table(surveyResult$neg)
Counts4
barplot(Counts4, col="gray", main="Count of Negative Mentions",  xlab="Score", ylab="Count")

#Distribution of Positive Remarks
Counts5 <- table(surveyResult$pos)
Counts5
barplot(Counts5, col="gray", main="Count of Positive Mentions",  xlab="Score", ylab="Count")

#Distribution of Very Positive Remarks
Counts6 <- table(surveyResult$vPos)
Counts6
barplot(Counts6, col="gray", main="Count of Very Positive Mentions",  xlab="Score", ylab="Count")

#Interaction of Comments
VERY.NEG.SUB <- subset(surveyResult, vNeg>=1)
NEG.SUB <- subset(surveyResult, neg>=1)
POS.SUB <- subset(surveyResult, pos>=1)
VERY.POS.SUB <- subset(surveyResult, vPos>=1)

#Very Negative Comments Affiliations
VERY.NEG.SUB$Very.Negative <- nrow(VERY.NEG.SUB)
VERY.NEG.SUB$Negative <- sum(VERY.NEG.SUB$neg)
VERY.NEG.SUB$Positive <- sum(VERY.NEG.SUB$pos)
VERY.NEG.SUB$Very.Positive <- sum(VERY.NEG.SUB$vPos)
VERY.NEG.SUB = VERY.NEG.SUB[1,7:10 ]
VERY.NEG.SUB <- t(VERY.NEG.SUB)
VERY.NEG.SUB <- as.data.frame(VERY.NEG.SUB)
colnames(VERY.NEG.SUB)[1] <- "Count"
barplot(VERY.NEG.SUB$Count, main = "Very Negative Affiliation", names.arg = c("Very Negative", "Negative", "Positive", "Very Positive"))

#Negative Comments Affiliations
NEG.SUB$Very.Negative <- sum(NEG.SUB$vNeg)
NEG.SUB$Negative <- nrow(NEG.SUB)
NEG.SUB$Positive <- sum(NEG.SUB$pos)
NEG.SUB$Very.Positive <- sum(NEG.SUB$vPos)
NEG.SUB = NEG.SUB[1,7:10 ]
NEG.SUB <- t(NEG.SUB)
NEG.SUB <- as.data.frame(NEG.SUB)
colnames(NEG.SUB)[1] <- "Count"
barplot(NEG.SUB$Count, main = "Negative Affiliation", names.arg = c("Very Negative", "Negative", "Positive", "Very Positive"))

#Positive Comments Affiliations
POS.SUB$Very.Negative <- sum(POS.SUB$vNeg)
POS.SUB$Negative <- sum(POS.SUB$neg)
POS.SUB$Positive <- nrow(POS.SUB)
POS.SUB$Very.Positive <- sum(POS.SUB$vPos)
POS.SUB = POS.SUB[1,7:10 ]
POS.SUB <- t(POS.SUB)
POS.SUB <- as.data.frame(POS.SUB)
colnames(POS.SUB)[1] <- "Count"
barplot(POS.SUB$Count, main = "Positive Affiliation", names.arg = c("Very Negative", "Negative", "Positive", "Very Positive"))

#Very Positive Comments Affiliations
VERY.POS.SUB$Very.Negative <- sum(VERY.POS.SUB$vNeg)
VERY.POS.SUB$Negative <- sum(VERY.POS.SUB$neg)
VERY.POS.SUB$Positive <- sum(VERY.POS.SUB$pos)
VERY.POS.SUB$Very.Positive <- nrow(VERY.POS.SUB)
VERY.POS.SUB = VERY.POS.SUB[1,7:10 ]
VERY.POS.SUB <- t(VERY.POS.SUB)
VERY.POS.SUB <- as.data.frame(VERY.POS.SUB)
colnames(VERY.POS.SUB)[1] <- "Count"
barplot(VERY.POS.SUB$Count, main = "Very Positive Affiliation", names.arg = c("Very Negative", "Negative", "Positive", "Very Positive"))


#SUBSET SCORED RESPONSES
POSITIVE<-subset(Search.scores, Search.scores$score >0)
POSITIVE$PIECH = "POSITIVE"
NEGATIVE<-subset(Search.scores, Search.scores$score <0)
NEGATIVE$PIECH = "NEGATIVE"
NEUTRAL<-subset(Search.scores, Search.scores$score ==0)
NEUTRAL$PIECH = "NEUTRAL"


POSITIVE1<-subset(surveyResult, surveyResult$Sentiment >0)
POSITIVE1$PIECH = "POSITIVE"
NEGATIVE1<-subset(surveyResult, surveyResult$Sentiment <0)
NEGATIVE1$PIECH = "NEGATIVE"
NEUTRAL1<-subset(surveyResult, surveyResult$Sentiment ==0)
NEUTRAL1$PIECH = "NEUTRAL"

######
colors = c("red", "yellow", "green") 
#####

#PIE CHART LIBRARY
library(plotrix)
#PIE CHART OF SCORING SYSTEM 1
PIE.CHART <- rbind(POSITIVE,NEGATIVE,NEUTRAL)
Counts7 <- table(PIE.CHART$PIECH)
Counts7
PIE.CHART.GRAPH <- pie(Counts7, main="Scoring System 1 Breakdown", col=colors)


#PIE CHART OF SCORING SYSTEM 2
PIE.CHART1 <- rbind(POSITIVE1,NEGATIVE1,NEUTRAL1)
Counts8 <- table(PIE.CHART1$PIECH)
Counts8
PIE.CHART.GRAPH2 <- pie(Counts8, main="Scoring System 2 Breakdown", col=colors)

#====================================================================================


library("tm")
library("SnowballC")
library("wordcloud")
library("RColorBrewer")

#DATA FRAMES
Search.textCLOUD <- as.matrix(Search.text$TEXT)
Search.textCLOUD <- gsub('the', '', Search.textCLOUD)
Search.textCLOUD <- gsub('THE', '', Search.textCLOUD)
Search.textCLOUD <- gsub('The', '', Search.textCLOUD)
Search.textCLOUD <- gsub('THe', '', Search.textCLOUD)
Search.textCLOUD <- gsub('and', '', Search.textCLOUD)
Search.textCLOUD <- gsub('nats', '', Search.textCLOUD)

POSITIVECLOUD <- as.matrix(POSITIVE$text)
POSITIVECLOUD <- gsub('the', '', POSITIVECLOUD)
POSITIVECLOUD <- gsub('THE', '', POSITIVECLOUD)
POSITIVECLOUD <- gsub('The', '', POSITIVECLOUD)
POSITIVECLOUD <- gsub('THe', '', POSITIVECLOUD)
POSITIVECLOUD <- gsub('and', '', POSITIVECLOUD)
POSITIVECLOUD <- gsub('nats', '', POSITIVECLOUD)

NEGATIVECLOUD <- as.matrix(NEGATIVE$text)
NEGATIVECLOUD <- gsub('the', '', NEGATIVECLOUD)
NEGATIVECLOUD <- gsub('THE', '', NEGATIVECLOUD)
NEGATIVECLOUD <- gsub('The', '', NEGATIVECLOUD)
NEGATIVECLOUD <- gsub('THe', '', NEGATIVECLOUD)
NEGATIVECLOUD <- gsub('and', '', NEGATIVECLOUD)
NEGATIVECLOUD <- gsub('nats', '', NEGATIVECLOUD)

NEUTRALCLOUD <- as.matrix(NEUTRAL$text)
NEUTRALCLOUD <- gsub('the', '', NEUTRALCLOUD)
NEUTRALCLOUD <- gsub('THE', '', NEUTRALCLOUD)
NEUTRALCLOUD <- gsub('The', '', NEUTRALCLOUD)
NEUTRALCLOUD <- gsub('THe', '', NEUTRALCLOUD)
NEUTRALCLOUD <- gsub('and', '', NEUTRALCLOUD)
NEUTRALCLOUD <- gsub('nats', '', NEUTRALCLOUD)


#Frequency Counts

#OVERALL
require(tm)
df <- data.frame(V1 = Search.textCLOUD, stringsAsFactors = FALSE)
mycorpus <- Corpus(DataframeSource(df))
tdm <- TermDocumentMatrix(mycorpus, control = list(removePunctuation = TRUE, stopwords = TRUE))
#Words with at least 100 uses
frq <- findFreqTerms(tdm, lowfreq=100)
frq <- as.matrix(frq)
#Word use Rank with Frequency Count
temp <- inspect(tdm)
FreqMat <- data.frame(Text = rownames(temp), Freq = rowSums(temp))
FreqMat<- FreqMat[order(-FreqMat$Freq),]
row.names(FreqMat) <- NULL
FreqMat$"Response type" <- "Overall"
write.csv(FreqMat, "R:/Business Strategy_Analytics/Garrett Georgia/Survey Data/Bounceback Overall Data/Overall Word Frequency.csv",row.names=TRUE)

#POSITIVE
require(tm)
df1 <- data.frame(V1 = POSITIVECLOUD, stringsAsFactors = FALSE)
mycorpus1 <- Corpus(DataframeSource(df1))
tdm1 <- TermDocumentMatrix(mycorpus1, control = list(removePunctuation = TRUE, stopwords = TRUE))
#Words with at least 100 uses
frq1 <- findFreqTerms(tdm1, lowfreq=100)
frq1 <- as.matrix(frq1)
#Word use Rank with Frequency Count
temp1 <- inspect(tdm1)
FreqMat1 <- data.frame(Text = rownames(temp1), Freq = rowSums(temp1))
FreqMat1<- FreqMat1[order(-FreqMat1$Freq),]
row.names(FreqMat1) <- NULL
FreqMat1$"Response type" <- "Positive"
write.csv(FreqMat1, "R:/Business Strategy_Analytics/Garrett Georgia/Survey Data/Bounceback Overall Data/Positive Word Frequency.csv",row.names=TRUE)

#NEGATIVE
require(tm)
df2 <- data.frame(V1 = NEGATIVECLOUD, stringsAsFactors = FALSE)
mycorpus2 <- Corpus(DataframeSource(df2))
tdm2 <- TermDocumentMatrix(mycorpus2, control = list(removePunctuation = TRUE, stopwords = TRUE))
#Words with at least 100 uses
frq2 <- findFreqTerms(tdm2, lowfreq=100)
frq2 <- as.matrix(frq2)
#Word use Rank with Frequency Count
temp2 <- inspect(tdm2)
FreqMat2 <- data.frame(Text = rownames(temp2), Freq = rowSums(temp2))
FreqMat2<- FreqMat2[order(-FreqMat2$Freq),]
row.names(FreqMat2) <- NULL
FreqMat2$"Response type" <- "Negative"
write.csv(FreqMat2, "R:/Business Strategy_Analytics/Garrett Georgia/Survey Data/Bounceback Overall Data/Negative Word Frequency.csv",row.names=TRUE)

#NEUTRAL
require(tm)
df3 <- data.frame(V1 = NEUTRALCLOUD, stringsAsFactors = FALSE)
mycorpus3 <- Corpus(DataframeSource(df3))
tdm3 <- TermDocumentMatrix(mycorpus3, control = list(removePunctuation = TRUE, stopwords = TRUE))
#Words with at least 100 uses
frq3 <- findFreqTerms(tdm3, lowfreq=100)
frq3 <- as.matrix(frq3)
#Word use Rank with Frequency Count
temp3 <- inspect(tdm3)
FreqMat3 <- data.frame(Text = rownames(temp3), Freq = rowSums(temp3))
FreqMat3<- FreqMat3[order(-FreqMat3$Freq),]
row.names(FreqMat3) <- NULL
FreqMat3$"Response type" <- "Neutral"
write.csv(FreqMat3, "R:/Business Strategy_Analytics/Garrett Georgia/Survey Data/Bounceback Overall Data/Neutral Word Frequency.csv",row.names=TRUE)
#===================================================================
FreqMat$"Rank"<-as.numeric(rownames(FreqMat))
FreqMat$"Rank"<-FreqMat$"Rank"+0

FreqMat1$"Rank"<-as.numeric(rownames(FreqMat1))
FreqMat1$"Rank"<-FreqMat1$"Rank"+0

FreqMat2$"Rank"<-as.numeric(rownames(FreqMat2))
FreqMat2$"Rank"<-FreqMat2$"Rank"+0

FreqMat3$"Rank"<-as.numeric(rownames(FreqMat3))
FreqMat3$"Rank"<-FreqMat3$"Rank"+0

Master.Freq <-rbind(FreqMat1, FreqMat2, FreqMat3)
write.csv(Master.Freq, "R:/Business Strategy_Analytics/Garrett Georgia/Survey Data/Bounceback Overall Data/Master Word Count Frequency.csv",row.names=TRUE)
#===================================================================
#MOST COMMON PHRASES

library(tau)

#OVERALL
bigrams = textcnt(Search.text$TEXT, n = 2, method = "string")
bigrams = bigrams[order(bigrams, decreasing = TRUE)]
overall.bigrams <- as.matrix(bigrams)

trigrams = textcnt(Search.text$TEXT, n = 3, method = "string")
trigrams = trigrams[order(trigrams, decreasing = TRUE)]
overall.trigrams <- as.matrix(trigrams)

#POSITIVE
bigrams = POSITIVE$text
bigrams <-as.character(bigrams)
bigrams = textcnt(bigrams, n = 2, method = "string")
bigrams = bigrams[order(bigrams, decreasing = TRUE)]
positve.bigrams <- as.matrix(bigrams)

trigrams= POSITIVE$text
trigrams <-as.character(trigrams)
trigrams = textcnt(trigrams, n = 3, method = "string")
trigrams = trigrams[order(trigrams, decreasing = TRUE)]
positve.trigrams <- as.matrix(trigrams)

#NEGATIVE
bigrams = NEGATIVE$text
bigrams <-as.character(bigrams)
bigrams = textcnt(bigrams, n = 2, method = "string")
bigrams = bigrams[order(bigrams, decreasing = TRUE)]
negative.bigrams <- as.matrix(bigrams)

trigrams= NEGATIVE$text
trigrams <-as.character(trigrams)
trigrams = textcnt(trigrams, n = 3, method = "string")
trigrams = trigrams[order(trigrams, decreasing = TRUE)]
negative.trigrams <- as.matrix(trigrams)

#NEUTRAL
bigrams = NEUTRAL$text
bigrams <-as.character(bigrams)
bigrams = textcnt(bigrams, n = 2, method = "string")
bigrams = bigrams[order(bigrams, decreasing = TRUE)]
neutral.bigrams <- as.matrix(bigrams)

trigrams= NEUTRAL$text
trigrams <-as.character(trigrams)
trigrams = textcnt(trigrams, n = 3, method = "string")
trigrams = trigrams[order(trigrams, decreasing = TRUE)]
neutral.trigrams <- as.matrix(trigrams)

#===================================================================

#OVERALL WORD CLOUD
#layout(matrix(c(1, 2), nrow=2), heights=c(2, 8))
#par(mar=rep(0, 4))
#plot.new()
#text(x=0.5, y=0.5, "Overall Word Cloud")
#OVERALL.CLOUD <- wordcloud(Search.textCLOUD,scale=c(4,.5), max.words=75,random.order=FALSE, random.color=TRUE, 
          #rot.per=.1,colors=brewer.pal(8, "Dark2"),
          #use.r.layout=FALSE,fixed.asp=TRUE)


#POSITIVE WORD CLOUD
#layout(matrix(c(1, 2), nrow=2), heights=c(2, 8))
#par(mar=rep(0, 4))
#plot.new()
#text(x=0.5, y=0.5, "Positive Word Cloud")
#POSITIVE.CLOUD <- wordcloud(POSITIVECLOUD,scale=c(4,.5), max.words=75,random.order=FALSE, random.color=TRUE, 
                           #rot.per=.1, colors=brewer.pal(8, "Dark2"),
                           #use.r.layout=FALSE,fixed.asp=TRUE)


#NEGATIVE WORD CLOUD
#layout(matrix(c(1, 2), nrow=2), heights=c(2, 8))
#par(mar=rep(0, 4))
#plot.new()
#text(x=0.5, y=0.5, "Negative Word Cloud")
#NEGATIVE.CLOUD <- wordcloud(NEGATIVECLOUD,scale=c(4,.5), max.words=75,random.order=FALSE, random.color=TRUE, 
                           #rot.per=.1, colors=brewer.pal(8, "Dark2"),
                           #use.r.layout=FALSE,fixed.asp=TRUE)

#NEUTRAL WORD CLOUD
#layout(matrix(c(1, 2), nrow=2), heights=c(2, 8))
#par(mar=rep(0, 4))
#plot.new()
#text(x=0.5, y=0.5, "Neutral Word Cloud")
#NEUTRAL.CLOUD <- wordcloud(NEUTRALCLOUD,scale=c(4,.5), max.words=75,random.order=FALSE, random.color=TRUE, 
                           #rot.per=.1, colors=brewer.pal(8, "Dark2"),
                           #use.r.layout=FALSE,fixed.asp=TRUE)

#===================================================================
Counts <-as.data.frame(Counts)
names(Counts)[1] <- "Score"
write.csv(Counts, file = "R:/Business Strategy_Analytics/Garrett Georgia/Survey Data/Bounceback Overall Data/Scoring System 1 Table.csv",row.names=FALSE)
#===================================================================
Counts2 <-as.data.frame(Counts2)
names(Counts2)[1] <- "Score"
write.csv(Counts2, file = "R:/Business Strategy_Analytics/Garrett Georgia/Survey Data/Bounceback Overall Data/Scoring System 2 Table.csv",row.names=FALSE)
#===================================================================
Counts7 <-as.data.frame(Counts7)
names(Counts7)[1] <- "Response"
write.csv(Counts7, file = "R:/Business Strategy_Analytics/Garrett Georgia/Survey Data/Bounceback Overall Data/Scoring System 1 Pie Table.csv",row.names=FALSE)
#===================================================================
Counts8 <-as.data.frame(Counts8)
names(Counts8)[1] <- "Response"
write.csv(Counts8, file = "R:/Business Strategy_Analytics/Garrett Georgia/Survey Data/Bounceback Overall Data/Scoring System 2 Pie Table.csv",row.names=FALSE)
#===================================================================
write.csv(VERY.NEG.SUB, file = "R:/Business Strategy_Analytics/Garrett Georgia/Survey Data/Bounceback Overall Data/Very Neg Aff.csv",row.names=TRUE)
write.csv(NEG.SUB, file = "R:/Business Strategy_Analytics/Garrett Georgia/Survey Data/Bounceback Overall Data/Neg Aff.csv",row.names=TRUE)
write.csv(POS.SUB, file = "R:/Business Strategy_Analytics/Garrett Georgia/Survey Data/Bounceback Overall Data/Pos Aff.csv",row.names=TRUE)
write.csv(VERY.POS.SUB, file = "R:/Business Strategy_Analytics/Garrett Georgia/Survey Data/Bounceback Overall Data/Very Pos Aff.csv",row.names=TRUE)
#===================================================================
Counts$"Scoring System" <- "System 1"
Counts2$"Scoring System" <- "System 2"
Scoring.System.Merge <-rbind(Counts, Counts2)
write.csv(Scoring.System.Merge, file = "R:/Business Strategy_Analytics/Garrett Georgia/Survey Data/Bounceback Overall Data/Scoring System 1 and 2 Table.csv",row.names=FALSE)
#===================================================================
Counts7$"Scoring System" <- "System 1"
Counts8$"Scoring System" <- "System 2"
Scoring.System.Merge2 <-rbind(Counts7, Counts8)
write.csv(Scoring.System.Merge2, file = "R:/Business Strategy_Analytics/Garrett Georgia/Survey Data/Bounceback Overall Data/Scoring System 1 and 2 Pie.csv",row.names=FALSE)
#===================================================================
VERY.NEG.SUB$Plot <- "Very Negative"
VERY.POS.SUB$Plot <- "Very Positive"
NEG.SUB$Plot <- "Negative"
POS.SUB$Plot <- "Positive"
#===================================================================
VERY.NEG.SUB$Emotion = rownames(VERY.NEG.SUB)
VERY.POS.SUB$Emotion = rownames(VERY.POS.SUB)
NEG.SUB$Emotion = rownames(NEG.SUB)
POS.SUB$Emotion = rownames(POS.SUB)
#===================================================================
Word.Affiliation <- rbind(VERY.NEG.SUB, VERY.POS.SUB, NEG.SUB, POS.SUB)
write.csv(Word.Affiliation, file = "R:/Business Strategy_Analytics/Garrett Georgia/Survey Data/Bounceback Overall Data/Word Affiliation.csv",row.names=FALSE)
