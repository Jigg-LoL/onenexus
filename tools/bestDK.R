library(gdata)
fdData = read.xls('FD1.xlsx')
fdData <- data.frame(lapply(fdData, as.character), stringsAsFactors=FALSE)

dkSum<-data.frame(top=NULL,jungle=NULL,mid=NULL,adc=NULL,sup=NULL,flex=NULL,points=NULL,price=NULL)

topPlayers<-filter(fdData,Role=='Top')
junglePlayers<-filter(fdData,Role=='Jungle')
midPlayers<-filter(fdData,Role=='Mid')
adcPlayers<-filter(fdData,Role=='ADC')
supportPlayers<-filter(fdData,Role=='Support')

for (t in 1:nrow(topPlayers)) {
  topPoints<-as.numeric(topPlayers$Points[t])
  topPrice<-as.numeric(topPlayers$Price[t])
  for (j in 1:nrow(junglePlayers)) {
    junglePoints<-as.numeric(junglePlayers$Points[j])
    junglePrice<-as.numeric(junglePlayers$Price[j])
    for (m in 1:nrow(midPlayers)) {
      midPoints<-as.numeric(midPlayers$Points[m])
      midPrice<-as.numeric(midPlayers$Price[m])
      for (a in 1:nrow(adcPlayers)) {
        adcPoints<-as.numeric(adcPlayers$Points[a])
        adcPrice<-as.numeric(adcPlayers$Price[a])
        for (s in 1:nrow(supportPlayers)) {
          supportPoints<-as.numeric(supportPlayers$Points[s])
          supportPrice<-as.numeric(supportPlayers$Price[s])
          for (f in 1:nrow(fdData)) {
            flexPoints<-as.numeric(fdData$Points[f])
            flexPrice<-as.numeric(fdData$Price[f])
            
            totalPoints<-sum(topPoints,junglePoints,midPoints,adcPoints,supportPoints,flexPoints)
            totalPrice<-sum(topPrice,junglePrice,midPrice,adcPrice,supportPrice,flexPrice)
            
            dkInd<-data.frame(top=topPlayers$Player[t],jungle=junglePlayers$Player[j],mid=midPlayers$Player[m],adc=adcPlayers$Player[a],
                              sup=supportPlayers$Player[s],flex=fdData$Player[f],points=totalPoints,price=totalPrice)
            
            dkSum<-rbind(dkSum,dkInd)
          }
        }
      }
    }
  }
}