rope_vis <- function(cumulatives,fliename='default') {
library(ggplot2)
library(wesanderson)
rm = matrix(c(0,0,0,-sqrt(2)/2,sqrt(2)/2,0,-sqrt(6)/6,-sqrt(6)/6,sqrt(6)/3),nrow=3,ncol=3)
tm = t(rm) %*% t(cbind(cumulatives$left,cumulatives$right,cumulatives$rope))
p1 = tm[2,]
p2 = tm[3,]
th = 0.01
rope = c(0,sqrt(2/3)+2*th)
left = c(-sqrt(2)/2-sqrt(3)*th,-1/sqrt(6)-th)
right = c(sqrt(2)/2+sqrt(3)*th,-1/sqrt(6)-th)
sp=ggplot(as.data.frame(cbind(p1,p2)), aes(x=p1, y=p2)) +
theme_void()+
geom_point(color='#348BD7',size=1)+xlim(left[1]-8*th,right[1]+8*th)+ylim(right[2]-8*th,rope[2]+8*th)+ 
coord_fixed()+
geom_line(data.frame(p1=c(rope[1],left[1]),p2=c(rope[2],left[2])),mapping=(aes(x=p1,y=p2)),color='orange')+
geom_line(data.frame(p1=c(left[1],right[1]),p2=c(left[2],right[2])),mapping=(aes(x=p1,y=p2)),color='orange')+
geom_line(data.frame(p1=c(rope[1],right[1]),p2=c(rope[2],right[2])),mapping=(aes(x=p1,y=p2)),color='orange')+

geom_line(data.frame(p1=c(0,(rope[1]+left[1])/2),p2=c(0,(rope[2]+left[2])/2)),mapping=(aes(x=p1,y=p2)),color='orange')+
geom_line(data.frame(p1=c(0,(right[1]+left[1])/2),p2=c(0,(right[2]+left[2])/2)),mapping=(aes(x=p1,y=p2)),color='orange')+
geom_line(data.frame(p1=c(0,(rope[1]+right[1])/2),p2=c(0,(rope[2]+right[2])/2)),mapping=(aes(x=p1,y=p2)),color='orange')+
annotate("text",x=left[1]-7*th,y=left[2]-7*th,label="Left")+annotate("text",x=right[1]+7*th,y=right[2]-7*th,label="Right")+
annotate("text",x=rope[1],y=rope[2]+7*th,label="Rope")+
stat_density_2d(aes(fill = ..level..), geom="polygon")+
  #scale_fill_gradientn(low="#348BD7", high="#D73A34")
scale_fill_gradientn(colours=wes_palette("Zissou1", 100, type = "continuous"))
 #scale_color_gradientn(colours = rainbow(5))
#scale_fill_gradientn(values=wes_palette("Zissou1"))

#png("left_right.png")
png(paste(fliename,'.png',sep=''))
print(sp)
dev.off()
return(fliename)

}