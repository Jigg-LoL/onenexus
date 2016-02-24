getPercentages <-function(playerName,gameId) {
  library(jsonlite)
  source("~/onenexus/tools/getGameDetails.R")
  
  sum<-0.0
  summ<-0.0
  summm<-0.0
  summmm<-0.0
  count<-0
  for (i in 1:length(gameId)) {
    currentGame<-getGameDetails(gameId[i])
    playerPosition<-which(currentGame$name==playerName)
    if (length(playerPosition)==0) { next }
    count<-count+1
    if (playerPosition<6) {set<-c(1,2,3,4,5)} else {set<-c(6,7,8,9,10)}
    playerGold<-currentGame$gold[playerPosition]
    playerDmg<-currentGame$dmgToChamps[playerPosition]
    playerTkn<-currentGame$dmgTaken[playerPosition]
    playerKP<-currentGame$kills[playerPosition]+currentGame$assists[playerPosition]
    totalGold<-sum(currentGame$gold[set[1]:set[5]])
    totalDmg<-sum(currentGame$dmgToChamps[set[1]:set[5]])
    totalTkn<-sum(currentGame$dmgTaken[set[1]:set[5]])
    totalKills<-sum(currentGame$kills[set[1]:set[5]])
    percentGold<-playerGold/totalGold
    percentDmg<-playerDmg/totalDmg
    percentTkn<-playerTkn/totalTkn
    percentKP<-playerKP/totalKills
    sum<-sum+percentGold
    summ<-summ+percentDmg
    summm<-summm+percentTkn
    summmm<-summmm+percentKP
  }
  finalPercentGold<-sum/count
  finalPercentDmg<-summ/count
  finalPercentTkn<-summm/count
  finalKP<-summmm/count
  return(data.frame(percentGold=finalPercentGold, percentDmg=finalPercentDmg, percentTkn=finalPercentTkn, percentKP=finalKP))
}