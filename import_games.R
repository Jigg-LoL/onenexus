txtFile<-readLines('import_games.txt')
for (i in 1:length(txtFile)) {
  gameHash<-substr(txtFile[i],68,103)
  idNum<-substr(gameHash,1,10)
  fullURL<-paste("https://acs.leagueoflegends.com/v1/stats/game/TRLH1/",gameHash,sep="")
  timeHash<-gsub('\\?','/timeline\\?',gameHash)
  timeURL<-paste("https://acs.leagueoflegends.com/v1/stats/game/TRLH1/",timeHash,sep="")
  
  download.file(fullURL,paste("GameData/NA/One/",idNum,sep=""))
  download.file(timeURL,paste("GameData/NA/One/timeline/",idNum,sep=""))
}