getGameDetails <- function(gameId) {
  library(jsonlite)
  library(dplyr)
  
  source("~/onenexus/tools/getChampName.R")
  
  filePath<-list.files(recursive=TRUE)[grep(gameId,list.files(recursive=TRUE))][1]
  timelinePath<-list.files(recursive=TRUE)[grep(gameId,list.files(recursive=TRUE))][2]
  gameData<-fromJSON(filePath)
  timeData<-fromJSON(timelinePath)
  frame<-data.frame(name=NULL,champion=NULL,kills=NULL,deaths=NULL,assists=NULL,dmgToChamps=NULL,heal=NULL,dmgTaken=NULL,gold=NULL,cs=NULL,jungleCs=NULL,jungleCsAlly=NULL,
                    jungleCsEnemy=NULL,visionWardsBought=NULL,sightWardsBought=NULL,wardsPlaced=NULL,wardsKilled=NULL,firstBlood=NULL,firstBloodAssist=NULL,
                    goldAtTen=NULL,csAtTen=NULL,jgCsAtTen=NULL,goldAtTwenty=NULL,csAtTwenty=NULL,jgCsAtTwenty=NULL,csDiffAtTen=NULL,goldDiffAtTen=NULL,csDiffAtTwenty=NULL,
                    goldDiffAtTwenty=NULL)
  
  for (i in 1:10) {
    name<-strsplit(gameData$participantIdentities$player$summonerName[i]," ")[[1]][-1]
    champion<-getChampName(gameData$participants$championId[i])
    kills<-gameData$participants$stats$kills[i]
    deaths<-gameData$participants$stats$deaths[i]
    assists<-gameData$participants$stats$assists[i]
    dmgToChamps<-gameData$participants$stats$totalDamageDealtToChampions[i]
    heal<-gameData$participants$stats$totalHeal[i]
    dmgTaken<-gameData$participants$stats$totalDamageTaken[i]
    gold<-gameData$participants$stats$goldEarned[i]
    cs<-gameData$participants$stats$totalMinionsKilled[i]+gameData$participants$stats$neutralMinionsKilled[i]
    jungleCs<-gameData$participants$stats$neutralMinionsKilled[i]
    jungleCsAlly<-gameData$participants$stats$neutralMinionsKilledTeamJungle[i]
    jungleCsEnemy<-gameData$participants$stats$neutralMinionsKilledEnemyJungle[i]
    visionWardsBought<-gameData$participants$stats$visionWardsBoughtInGame[i]
    sightWardsBought<-gameData$participants$stats$sightWardsBoughtInGame[i]
    wardsPlaced<-gameData$participants$stats$wardsPlaced[i]
    wardsKilled<-gameData$participants$stats$wardsKilled[i]
    firstBlood<-gameData$participants$stats$firstBloodKill[i]
    firstBloodAssist<-gameData$participants$stats$firstBloodAssist[i]
    goldAtTen<-timeData$frames$participantFrames[[i]]$totalGold[11]
    csAtTen<-timeData$frames$participantFrames[[i]]$minionsKilled[11]+timeData$frames$participantFrames[[i]]$jungleMinionsKilled[11]
    jgCsAtTen<-timeData$frames$participantFrames[[i]]$jungleMinionsKilled[11]
    goldAtTwenty<-timeData$frames$participantFrames[[i]]$totalGold[21]
    csAtTwenty<-timeData$frames$participantFrames[[i]]$minionsKilled[21]+timeData$frames$participantFrames[[i]]$jungleMinionsKilled[21]
    jgCsAtTwenty<-timeData$frames$participantFrames[[i]]$jungleMinionsKilled[21]
    if (i<=5) {
      csDiffAtTen<-(timeData$frames$participantFrames[[i]]$minionsKilled[11]+timeData$frames$participantFrames[[i]]$jungleMinionsKilled[11])-(timeData$frames$participantFrames[[i+5]]$minionsKilled[11]+timeData$frames$participantFrames[[i+5]]$jungleMinionsKilled[11])
      goldDiffAtTen<-timeData$frames$participantFrames[[i]]$totalGold[11]-timeData$frames$participantFrames[[i+5]]$totalGold[11]
      csDiffAtTwenty<-(timeData$frames$participantFrames[[i]]$minionsKilled[21]+timeData$frames$participantFrames[[i]]$jungleMinionsKilled[21])-(timeData$frames$participantFrames[[i+5]]$minionsKilled[21]+timeData$frames$participantFrames[[i+5]]$jungleMinionsKilled[21])
      goldDiffAtTwenty<-timeData$frames$participantFrames[[i]]$totalGold[21]-timeData$frames$participantFrames[[i+5]]$totalGold[21]
    } else {
      csDiffAtTen<-(timeData$frames$participantFrames[[i]]$minionsKilled[11]+timeData$frames$participantFrames[[i]]$jungleMinionsKilled[11])-(timeData$frames$participantFrames[[i-5]]$minionsKilled[11]+timeData$frames$participantFrames[[i-5]]$jungleMinionsKilled[11])
      goldDiffAtTen<-timeData$frames$participantFrames[[i]]$totalGold[11]-timeData$frames$participantFrames[[i-5]]$totalGold[11]
      csDiffAtTwenty<-(timeData$frames$participantFrames[[i]]$minionsKilled[21]+timeData$frames$participantFrames[[i]]$jungleMinionsKilled[21])-(timeData$frames$participantFrames[[i-5]]$minionsKilled[21]+timeData$frames$participantFrames[[i-5]]$jungleMinionsKilled[21])
      goldDiffAtTwenty<-timeData$frames$participantFrames[[i]]$totalGold[21]-timeData$frames$participantFrames[[i-5]]$totalGold[21]
    }
    
    playerFrame<-data.frame(name=name,champion=champion,kills=kills,deaths=deaths,assists=assists,dmgToChamps=dmgToChamps,heal=heal,dmgTaken=dmgTaken,gold=gold,cs=cs,jungleCs=jungleCs,
                            jungleCsAlly=jungleCsAlly,jungleCsEnemy=jungleCsEnemy,visionWardsBought=visionWardsBought,sightWardsBought=sightWardsBought,
                            wardsPlaced=wardsPlaced,wardsKilled=wardsKilled,firstBlood=firstBlood,firstBloodAssist=firstBloodAssist,goldAtTen=goldAtTen,csAtTen=csAtTen,
                            jgCsAtTen=jgCsAtTen,goldAtTwenty=goldAtTwenty,csAtTwenty=csAtTwenty,jgCsAtTwenty=jgCsAtTwenty,csDiffAtTen=csDiffAtTen,goldDiffAtTen=goldDiffAtTen,
                            csDiffAtTwenty=csDiffAtTwenty,goldDiffAtTwenty=goldDiffAtTwenty)
    frame<-rbind(frame,playerFrame)
  }
  return(frame)
}