getChampName <- function(champId) {
  champions<-fromJSON("~/onenexus/StaticData/champion.json")
  for (i in 1:length(champions$data)) {
    if (champions$data[[i]]$key == toString(champId))
    break
  }
  champions$data[[i]]$name
}