txtFile<-readLines('import_games.txt')
for (i in 1:length(txtFile)) {
  gameHash<-substr(txtFile[i],67,98) #68,103 for NA/EU, 68,99 for KR, 67/98 for TW
  idNum<-substr(gameHash,1,6) #10 for NA/EU, 6 for KR
  fullURL<-paste("https://acs.leagueoflegends.com/v1/stats/game/TRTW/",gameHash,sep="")
  timeHash<-gsub('\\?','/timeline\\?',gameHash)
  timeURL<-paste("https://acs.leagueoflegends.com/v1/stats/game/TRTW/",timeHash,sep="")
  
  download.file(fullURL,paste("GameData/TW/Gauntlet/",idNum,sep=""))
  download.file(timeURL,paste("GameData/TW/Gauntlet/timeline/",idNum,sep=""))
}