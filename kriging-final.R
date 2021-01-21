############导入数据#########################################################################

raredata <- read.csv("B:/DESKTOP/hegangkelige/2018/20181022数据整理/mgl.csv",header=TRUE,encoding="utf_8")
#head(raredata)
#No.  y x    v
#1      1  0 0 10.2
#2      2  2 2  7.3
#3      3  0 6  6.9
#4      4 20 0  8.0
#5      5 18 2  8.9
#6      6 20 6 10.9

x<-raredata$x
y<-raredata$y
z<-raredata$v

############导入包###########################################################################

library(kriging)
library(gstat)
library(ggplot2)
library(lattice)

############插值#############################################################################

#kriging(x, y, response, model = 'spherical', lags = 18.03, pixels = 150, polygons = NULL)
kriged <- kriging(x, y, z, model = 'spherical', polygons=NULL, pixels=300)
#image(kriged, xlim = extendrange(x), ylim = extendrange(y))
#image(kriged, xlim = extendrange(x), ylim = extendrange(y),col = hcl.colors(12, "YlOrRd", rev = TRUE))
############计算半边异方差###################################################################
kriged$model
kriged$nugget
kriged$range
kriged$sill
kriged$pixel
############作图#############################################################################

plot(kriged,main='',xlab='',ylab='')
#levelplot(kriged$map$pred ~ kriged$map$x+kriged$map$y, cuts = 50,
#main="",contour = TRUE,labels = FALSE, col.regions = terrain.colors(255),  pretty = TRUE)
levelplot(kriged$map$pred ~ kriged$map$x+kriged$map$y, cuts = 24,
          main="",contour = TRUE,labels = FALSE, col.regions = hcl.colors(24, "YlOrRd", rev = TRUE),  pretty = TRUE)

###########结束##############################################################################