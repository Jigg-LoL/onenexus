goldVsDmg <- function(playerName,gameId) {

  source("tools/getPercentages.R")
  
  frame<-data.frame(gold=NULL,dmg=NULL)
  
  for (i in 1:length(gameId)) {
    tempPerc<-getPercentages(playerName,gameId[i])
    localFrame<-data.frame(gold=tempPerc$percentGold,dmg=tempPerc$percentDmg)
    frame<-rbind(frame,localFrame)
  }
  return(frame)
}