ggplot(dlVS, aes(x=diff*100)) + 
  geom_point(aes(y=dmgdiff*100),alpha=0.35,size=4,color='#ee4957') + 
  geom_smooth(se=FALSE,color='#ee4957',aes(y=dmgdiff*100),size=1.25,method=lm) + 
  geom_point(data=haVS, aes(x=diff*100,y=dmgdiff*100), alpha=0.35, size=4, color='#7f0d7a') + 
  geom_smooth(data=haVS, se=FALSE,aes(y=dmgdiff*100),color='#7f0d7a',size=1.25,method=lm) + 
  geom_point(data=svVS, aes(x=diff*100,y=dmgdiff*100), alpha=0.35, size=4, color='#008ed4') + 
  geom_smooth(data=svVS, se=FALSE,aes(y=dmgdiff*100),color='#008ed4',size=1.25,method=lm) + 
  geom_point(data=bjVS, aes(x=diff*100,y=dmgdiff*100), alpha=0.35, size=4, color='#3c3c3c') + 
  geom_smooth(data=bjVS, se=FALSE,aes(y=dmgdiff*100),color='#3c3c3c',size=1.25,method=lm) + 
  geom_point(data=ysVS, aes(x=diff*100,y=dmgdiff*100), alpha=0.35, size=4, color='#bca04d') + 
  geom_smooth(data=ysVS, se=FALSE,aes(y=dmgdiff*100),color='#bca04d',size=1.25,method=lm) +
  theme_bw() +
  # Set the entire chart region to a light gray color
  theme(panel.background=element_rect(fill="#F0F0F0")) +
  theme(plot.background=element_rect(fill="#F0F0F0")) +
  theme(panel.border=element_rect(colour="#F0F0F0")) +
  # Format the grid
  theme(panel.grid.major=element_line(colour="#D0D0D0",size=.75)) +
  scale_x_continuous(minor_breaks=0,breaks=seq(-5,5,1),limits=c(-4.3,4.3)) +
  scale_y_continuous(minor_breaks=0,breaks=seq(-30,30,6),limits=c(-32,32)) +
  theme(axis.ticks=element_blank()) +
  # Dispose of the legend
  theme(legend.position="none") +
  # Set title and axis labels, and format these and tick marks
  ggtitle("TSM Player Damage Dependency on Gold") +
  theme(plot.title=element_text(face="bold",hjust=-.08,vjust=2,colour="#3C3C3C",size=20)) +
  ylab("Percent Damage Difference from Average") +
  xlab("Percent Gold Difference from Average") +
  theme(axis.text.x=element_text(size=11,colour="#535353",face="bold")) +
  theme(axis.text.y=element_text(size=11,colour="#535353",face="bold")) +
  theme(axis.title.y=element_text(size=11,colour="#535353",face="bold",vjust=1.5)) +
  theme(axis.title.x=element_text(size=11,colour="#535353",face="bold",vjust=-.5)) +
  # Plot margins and finally line annotations
  theme(plot.margin = unit(c(1, 1, .5, .7), "cm")) +
  annotate("text",x=-3.3,y=-7,label="Doublelift",colour="#ee4957",fontface="bold") +
  annotate("text",x=3.5,y=16,label="Hauntzer",colour="#7f0d7a",fontface="bold") +
  annotate("text",x=2.4,y=1,label="Svenskeren",colour="#008ed4",fontface="bold") +
  annotate("text",x=3.2,y=5,label="Bjergsen",colour="#3c3c3c",fontface="bold") +
  annotate("text",x=-1.7,y=0.6,label="YellOwStaR",colour="#bca04d",fontface="bold")