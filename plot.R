ggplot(dlVS, aes(x=diff, y=dmgdiff)) + 
  geom_point(alpha=0.35,size=4,color='red') + 
  geom_smooth(se=FALSE,color='red',aes(label='Doublelift',size=10),size=1.25,method=lm) + 
  geom_point(data=haVS, aes(x=diff,y=dmgdiff), alpha=0.35, size=4, color='blue') + 
  geom_smooth(data=haVS, se=FALSE,color='blue',size=1.25,method=lm) + 
  geom_point(data=svVS, aes(x=diff,y=dmgdiff), alpha=0.35, size=4, color='green') + 
  geom_smooth(data=svVS, se=FALSE,color='green',size=1.25,method=lm) + 
  geom_point(data=bjVS, aes(x=diff,y=dmgdiff), alpha=0.35, size=4, color='black') + 
  geom_smooth(data=bjVS, se=FALSE,color='black',size=1.25,method=lm) + 
  geom_point(data=ysVS, aes(x=diff,y=dmgdiff), alpha=0.35, size=4, color='orange') + 
  geom_smooth(data=ysVS, se=FALSE,color='orange',size=1.25,method=lm) +
  theme_bw() +
  # Set the entire chart region to a light gray color
  theme(panel.background=element_rect(fill="#F0F0F0")) +
  theme(plot.background=element_rect(fill="#F0F0F0")) +
  theme(panel.border=element_rect(colour="#F0F0F0"))