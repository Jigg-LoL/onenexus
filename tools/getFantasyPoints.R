getFantasyPoints <- function(gameId,playerName) {
  
  library(dplyr)
  library(jsonlite)
  
  frame<-data.frame(name=NULL,kills=NULL,deaths=NULL,assists=NULL,cs=NULL)
  fanSum<-data.frame(name=NULL,points=NULL,games=NULL)
  
  for (i in 1:length(gameId)) {
    filePath<-list.files(recursive=TRUE)[grep(gameId[i],list.files(recursive=TRUE))][1]
    gameData<-fromJSON(filePath)
    for (i in 1:10) {
      name<-strsplit(gameData$participantIdentities$player$summonerName[i]," ")[[1]][-1]
      kills<-gameData$participants$stats$kills[i]
      deaths<-gameData$participants$stats$deaths[i]
      assists<-gameData$participants$stats$assists[i]
      cs<-gameData$participants$stats$totalMinionsKilled[i]+gameData$participants$stats$neutralMinionsKilled[i]
      
      playerFrame<-data.frame(name=name,kills=kills,deaths=deaths,assists=assists,cs=cs)
      frame<-rbind(frame,playerFrame)
    }
    #currGame<-getGameDetails(gameId[i])
    #pGame<-filter(currGame,name==playerName)
    
    #frame<-rbind(frame,pGame)
  }
  for (i in 1:length(playerName)) {
    pGame<-filter(frame,name==playerName[i])
    fantasyPointsAv<-mean(pGame$kills)*3+mean(pGame$assists)*2-mean(pGame$deaths)+mean(pGame$cs)/50+2*nrow(filter(pGame,kills>=10 | assists>=10))/nrow(pGame)
    fanInd<-data.frame(name=playerName[i],points=fantasyPointsAv,games=nrow(pGame))
    fanSum<-rbind(fanSum,fanInd)
  }
  return(fanSum)
}