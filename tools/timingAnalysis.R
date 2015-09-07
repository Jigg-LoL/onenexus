timingAnalysis <- function(gameId) {
  library(jsonlite)
  
  ### Initialize Variables ###
  blueFirstBloodTime<-NULL
  redFirstBloodTime<-NULL
  blueFirstTowerTime<-NULL
  redFirstTowerTime<-NULL
  blueFirstDragTime<-NULL
  redFirstDragTime<-NULL
  blueFirstBaronTime<-NULL
  redFirstBaronTime<-NULL
  blueFirstInhibTime<-NULL
  redFirstInhibTime<-NULL
  timelinePath<-list.files(recursive=TRUE)[grep(gameId,list.files(recursive=TRUE))][2]
  timeData<-fromJSON(timelinePath)
  
  for (i in 1:length(1:length(timeData$frames$events))) {
    # GET FIRST BLOOD TIMERS
    if ("CHAMPION_KILL" %in% timeData$frames$events[[i]]$type) {
      if (any(is.null(blueFirstBloodTime) & sum(timeData$frames$events[[i]]$type=="CHAMPION_KILL") & timeData$frames$events[[i]]$killerId[timeData$frames$events[[i]]$type=="CHAMPION_KILL"]<=5)) {
        blueFirstBloodTime<-timeData$frames$events[[i]]$timestamp[timeData$frames$events[[i]]$type=="CHAMPION_KILL" & timeData$frames$events[[i]]$killerId<=5][1]/60000
      }
      if (any(is.null(redFirstBloodTime) & sum(timeData$frames$events[[i]]$type=="CHAMPION_KILL") & timeData$frames$events[[i]]$killerId[timeData$frames$events[[i]]$type=="CHAMPION_KILL"]>5)) {
        redFirstBloodTime<-timeData$frames$events[[i]]$timestamp[timeData$frames$events[[i]]$type=="CHAMPION_KILL" & timeData$frames$events[[i]]$killerId>5][1]/60000
      }
    }
    
    # GET FIRST TOWER and INHIB TIMERS
    if ("BUILDING_KILL" %in% timeData$frames$events[[i]]$type) {
      # TOWER TIMER
      if (any(is.null(blueFirstTowerTime) & timeData$frames$events[[i]]$buildingType[timeData$frames$events[[i]]$type=="BUILDING_KILL"]=="TOWER_BUILDING" & timeData$frames$events[[i]]$teamId[timeData$frames$events[[i]]$type=="BUILDING_KILL"]==200)) {
        blueFirstTowerTime<-timeData$frames$events[[i]]$timestamp[timeData$frames$events[[i]]$type=="BUILDING_KILL" & timeData$frames$events[[i]]$buildingType=="TOWER_BUILDING" & timeData$frames$events[[i]]$teamId==200][1]/60000
      }
      if (any(is.null(redFirstTowerTime) & timeData$frames$events[[i]]$buildingType[timeData$frames$events[[i]]$type=="BUILDING_KILL"]=="TOWER_BUILDING" & timeData$frames$events[[i]]$teamId[timeData$frames$events[[i]]$type=="BUILDING_KILL"]==100)) {
        redFirstTowerTime<-timeData$frames$events[[i]]$timestamp[timeData$frames$events[[i]]$type=="BUILDING_KILL" & timeData$frames$events[[i]]$buildingType=="TOWER_BUILDING" & timeData$frames$events[[i]]$teamId==100][1]/60000
      }
      
      # INHIB TIMER
      if (any(is.null(blueFirstInhibTime) & timeData$frames$events[[i]]$buildingType[timeData$frames$events[[i]]$type=="BUILDING_KILL"]=="INHIBITOR_BUILDING" & timeData$frames$events[[i]]$teamId[timeData$frames$events[[i]]$type=="BUILDING_KILL"]==200)) {
        blueFirstInhibTime<-timeData$frames$events[[i]]$timestamp[timeData$frames$events[[i]]$type=="BUILDING_KILL" & timeData$frames$events[[i]]$buildingType=="INHIBITOR_BUILDING" & timeData$frames$events[[i]]$teamId==200][1]/60000
      }
      if (any(is.null(redFirstInhibTime) & timeData$frames$events[[i]]$buildingType[timeData$frames$events[[i]]$type=="BUILDING_KILL"]=="INHIBITOR_BUILDING" & timeData$frames$events[[i]]$teamId[timeData$frames$events[[i]]$type=="BUILDING_KILL"]==100)) {
        redFirstInhibTime<-timeData$frames$events[[i]]$timestamp[timeData$frames$events[[i]]$type=="BUILDING_KILL" & timeData$frames$events[[i]]$buildingType=="INHIBITOR_BUILDING" & timeData$frames$events[[i]]$teamId==100][1]/60000
      }
    }
    
    # GET FIRST DRAGON and BARON TIMERS
    if ("ELITE_MONSTER_KILL" %in% timeData$frames$events[[i]]$type) {
      # DRAGON TIMER
      if (any(is.null(blueFirstDragTime) & timeData$frames$events[[i]]$monsterType[timeData$frames$events[[i]]$type=="ELITE_MONSTER_KILL"]=="DRAGON" & timeData$frames$events[[i]]$killerId[timeData$frames$events[[i]]$type=="ELITE_MONSTER_KILL"]<=5)) {
        blueFirstDragTime<-timeData$frames$events[[i]]$timestamp[timeData$frames$events[[i]]$type=="ELITE_MONSTER_KILL" & timeData$frames$events[[i]]$monsterType=="DRAGON" & timeData$frames$events[[i]]$killerId<=5][1]/60000
      }
      if (any(is.null(redFirstDragTime) & timeData$frames$events[[i]]$monsterType[timeData$frames$events[[i]]$type=="ELITE_MONSTER_KILL"]=="DRAGON" & timeData$frames$events[[i]]$killerId[timeData$frames$events[[i]]$type=="ELITE_MONSTER_KILL"]>5)) {
        redFirstDragTime<-timeData$frames$events[[i]]$timestamp[timeData$frames$events[[i]]$type=="ELITE_MONSTER_KILL" & timeData$frames$events[[i]]$monsterType=="DRAGON" & timeData$frames$events[[i]]$killerId>5][1]/60000
      }
      
      # BARON TIMER
      if (any(is.null(blueFirstBaronTime) & timeData$frames$events[[i]]$monsterType[timeData$frames$events[[i]]$type=="ELITE_MONSTER_KILL"]=="BARON_NASHOR" & timeData$frames$events[[i]]$killerId[timeData$frames$events[[i]]$type=="ELITE_MONSTER_KILL"]<=5)) {
        blueFirstBaronTime<-timeData$frames$events[[i]]$timestamp[timeData$frames$events[[i]]$type=="ELITE_MONSTER_KILL" & timeData$frames$events[[i]]$monsterType=="BARON_NASHOR" & timeData$frames$events[[i]]$killerId<=5][1]/60000
      }
      if (any(is.null(redFirstBaronTime) & timeData$frames$events[[i]]$monsterType[timeData$frames$events[[i]]$type=="ELITE_MONSTER_KILL"]=="BARON_NASHOR" & timeData$frames$events[[i]]$killerId[timeData$frames$events[[i]]$type=="ELITE_MONSTER_KILL"]>5)) {
        redFirstBaronTime<-timeData$frames$events[[i]]$timestamp[timeData$frames$events[[i]]$type=="ELITE_MONSTER_KILL" & timeData$frames$events[[i]]$monsterType=="BARON_NASHOR" & timeData$frames$events[[i]]$killerId>5][1]/60000
      }
    }
  }
}