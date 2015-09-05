getGameIds <- function(region=c("NA","EU","KR","CN"),week="all") {
  idList<-c()
  for (r in 1:length(region)) {
    if (week=="all") {
      weekVector<-list.files(paste("GameData/",region[r],sep=""))
      for (w in 1:length(list.files(paste("GameData/",region,sep="")))) {
        wIds<-list.files(paste("GameData/",region[r],"/",weekVector[w],sep=""))[1:length(list.files(paste("GameData/",region[r],"/",weekVector[w],sep="")))-1]
        idList<-c(idList,wIds)
      }
    } else {
      weekVector<-week
      for (w in 1:length(weekVector)) {
        wIds<-list.files(paste("GameData/",region[r],"/",weekVector[w],sep=""))[1:length(list.files(paste("GameData/",region[r],"/",weekVector[w],sep="")))-1]
        idList<-c(idList,wIds)
      }
    }
  }
  return(idList)
}