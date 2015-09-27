getPlayerHistory <- function(gameId,playerName) {
  
  library(dplyr)
  source("~/onenexus/tools/getGameDetails.R")
  
  frame<-data.frame(name=NULL,champion=NULL,kills=NULL,deaths=NULL,assists=NULL,dmgToChamps=NULL,heal=NULL,dmgTaken=NULL,gold=NULL,cs=NULL,jungleCs=NULL,jungleCsAlly=NULL,
                    jungleCsEnemy=NULL,visionWardsBought=NULL,sightWardsBought=NULL,wardsPlaced=NULL,wardsKilled=NULL,firstBlood=NULL,firstBloodAssist=NULL,
                    goldAtTen=NULL,csAtTen=NULL,jgCsAtTen=NULL,goldAtTwenty=NULL,csAtTwenty=NULL,jgCsAtTwenty=NULL,csDiffAtTen=NULL,goldDiffAtTen=NULL,csDiffAtTwenty=NULL,
                    goldDiffAtTwenty=NULL)
  
  for (i in 1:length(gameId)) {
    currGame<-getGameDetails(gameId[i])
    pGame<-filter(currGame,name==playerName)
    
    frame<-rbind(frame,pGame)
  }
  return(frame)
}