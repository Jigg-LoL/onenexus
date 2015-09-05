getGameSummary <- function(gameId) {
  library(jsonlite)
  
  source("~/onenexus/tools/getChampName.R")
  
  frame<-data.frame(gameId=NULL,region=NULL,week=NULL,blueTeam=NULL,redTeam=NULL,winner=NULL,gameLength=NULL,blueGold=NULL,redGold=NULL,
                    blueKills=NULL,redKills=NULL,blueTowers=NULL,redTowers=NULL,blueInhibs=NULL,redInhibs=NULL,
                    blueDragons=NULL,redDragons=NULL,blueBarons=NULL,redBarons=NULL,
                    blueTop=NULL,blueJng=NULL,blueMid=NULL,blueAdc=NULL,blueSup=NULL,
                    redTop=NULL,redJng=NULL,redMid=NULL,redAdc=NULL,redSup=NULL,
                    firstBlood=NULL,firstTower=NULL,firstInhib=NULL,firstDragon=NULL,firstBaron=NULL,
                    blueBan1=NULL,redBan1=NULL,blueBan2=NULL,redBan2=NULL,blueBan3=NULL,redBan3=NULL)
  
  for (i in 1:length(gameId)) {
    gId<-gameId[i]
  
    filePath<-list.files(recursive=TRUE)[grep(gId,list.files(recursive=TRUE))][1]
    gameData<-fromJSON(filePath)
    champions<-fromJSON("~/onenexus/StaticData/champion.json")
    
    ### Gather data for DataFrame ###
    region<-strsplit(filePath,"/")[[1]][2]
    week<-strsplit(filePath,"/")[[1]][3]
    blueTeam<-strsplit(gameData$participantIdentities$player$summonerName[1]," ")[[1]][1]
    redTeam<-strsplit(gameData$participantIdentities$player$summonerName[6]," ")[[1]][1]
    if (gameData$teams$win[1]=="Win") {winner<-blueTeam} else {winner<-redTeam}
    gameLength<-gameData$gameDuration/60
    blueGold<-sum(gameData$participants$stats$goldEarned[1:5])
    redGold<-sum(gameData$participants$stats$goldEarned[6:10])
    blueKills<-sum(gameData$participants$stats$kills[1:5])
    redKills<-sum(gameData$participants$stats$kills[6:10])
    blueTowers<-gameData$teams$towerKills[1]
    redTowers<-gameData$teams$towerKills[2]
    blueInhibs<-gameData$teams$inhibitorKills[1]
    redInhibs<-gameData$teams$inhibitorKills[2]
    blueDragons<-gameData$teams$dragonKills[1]
    redDragons<-gameData$teams$dragonKills[2]
    blueBarons<-gameData$teams$baronKills[1]
    redBarons<-gameData$teams$baronKills[2]
    blueTop<-getChampName(gameData$participants$championId[1])
    blueJng<-getChampName(gameData$participants$championId[2])
    blueMid<-getChampName(gameData$participants$championId[3])
    blueAdc<-getChampName(gameData$participants$championId[4])
    blueSup<-getChampName(gameData$participants$championId[5])
    redTop<-getChampName(gameData$participants$championId[6])
    redJng<-getChampName(gameData$participants$championId[7])
    redMid<-getChampName(gameData$participants$championId[8])
    redAdc<-getChampName(gameData$participants$championId[9])
    redSup<-getChampName(gameData$participants$championId[10])
    if (gameData$teams$firstBlood[1]==TRUE) {firstBlood<-blueTeam} else {firstBlood<-redTeam}
    if (gameData$teams$firstTower[1]==TRUE) {firstTower<-blueTeam} else {firstTower<-redTeam}
    if (gameData$teams$firstInhibitor[1]==TRUE) {firstInhib<-blueTeam} else {firstInhib<-redTeam}
    if (gameData$teams$firstDragon[1]==TRUE) {firstDragon<-blueTeam} else {firstDragon<-redTeam}
    if (gameData$teams$firstBaron[1]==TRUE) {firstBaron<-blueTeam} else {firstBaron<-redTeam}
    blueBan1<-getChampName(gameData$teams$bans[[1]]$championId[1])
    redBan1<-getChampName(gameData$teams$bans[[2]]$championId[1])
    blueBan2<-getChampName(gameData$teams$bans[[1]]$championId[2])
    redBan2<-getChampName(gameData$teams$bans[[2]]$championId[2])
    blueBan3<-getChampName(gameData$teams$bans[[1]]$championId[3])
    redBan3<-getChampName(gameData$teams$bans[[2]]$championId[3])
    
    gameFrame<-data.frame(gameId=gId,region=region,week=week,blueTeam=blueTeam,redTeam=redTeam,winner=winner,gameLength=gameLength,blueGold=blueGold,redGold=redGold,
                          blueKills=blueKills,redKills=redKills,blueTowers=blueTowers,redTowers=redTowers,blueInhibs=blueInhibs,redInhibs=redInhibs,
                          blueDragons=blueDragons,redDragons=redDragons,blueBarons=blueBarons,redBarons=redBarons,
                          blueTop=blueTop,blueJng=blueJng,blueMid=blueMid,blueAdc=blueAdc,blueSup=blueSup,
                          redTop=redTop,redJng=redJng,redMid=redMid,redAdc=redAdc,redSup=redSup,
                          firstBlood=firstBlood,firstTower=firstTower,firstInhib=firstInhib,firstDragon=firstDragon,firstBaron=firstBaron,
                          blueBan1=blueBan1,redBan1=redBan1,blueBan2=blueBan2,redBan2=redBan2,blueBan3=blueBan3,redBan3=redBan3)
    
    frame<-rbind(frame,gameFrame)
  }
  return(frame)
}