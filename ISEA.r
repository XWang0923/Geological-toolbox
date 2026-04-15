library(dggridR)
library(collapse)
library(sf)
library(xlsx)
options(scipen=200, digits=4)

ff <- "Tri"




fil <- paste("Mo_TOC_", ff, ".xlsx", sep="", collapse=NULL)

#Construct a global grid with cells approximately 1000 miles across
dggs          <- dgconstruct(projection='ISEA', res=4, metric=FALSE, resround='down')

#Load included test data set
data <- read.xlsx(fil, sheetIndex=1)

#Get the corresponding grid cells for each earthquake epicenter (lat-long pair)
data$cell <- dgGEO_to_SEQNUM(dggs,data$plng,data$plat)$seqnum

#Converting SEQNUM to GEO gives the center coordinates of the cells
cellcenters <- dgSEQNUM_to_GEO(dggs,data$cell)

#Get the number of earthquakes in each cell
sam_counts <- data |> fcount(cell, name = "count")

#Get the grid cell boundaries for cells which had quakes
grid <- dgcellstogrid(dggs,sam_counts$cell)

#Update the grid cells' properties to include the number of earthquakes
#in each cell
grid <- merge(grid,sam_counts,by.x="seqnum",by.y="cell")

write.xlsx(data, fil, sheetName="Sheet2", append=TRUE)
write.xlsx(grid$seqnum, fil, sheetName="Sheet3", append=TRUE)
write.xlsx(grid$geometry, fil, sheetName="Sheet4", append=TRUE)




fil <- paste("MoEF_UEF_", ff, ".xlsx", sep="", collapse=NULL)

#Construct a global grid with cells approximately 1000 miles across
dggs          <- dgconstruct(projection='ISEA', res=4, metric=FALSE, resround='down')

#Load included test data set
data <- read.xlsx(fil, sheetIndex=1)

#Get the corresponding grid cells for each earthquake epicenter (lat-long pair)
data$cell <- dgGEO_to_SEQNUM(dggs,data$plng,data$plat)$seqnum

#Converting SEQNUM to GEO gives the center coordinates of the cells
cellcenters <- dgSEQNUM_to_GEO(dggs,data$cell)

#Get the number of earthquakes in each cell
sam_counts <- data |> fcount(cell, name = "count")

#Get the grid cell boundaries for cells which had quakes
grid <- dgcellstogrid(dggs,sam_counts$cell)

#Update the grid cells' properties to include the number of earthquakes
#in each cell
grid <- merge(grid,sam_counts,by.x="seqnum",by.y="cell")

write.xlsx(data, fil, sheetName="Sheet2", append=TRUE)
write.xlsx(grid$seqnum, fil, sheetName="Sheet3", append=TRUE)
write.xlsx(grid$geometry, fil, sheetName="Sheet4", append=TRUE)




fil <- paste("TOC_P_", ff, ".xlsx", sep="", collapse=NULL)

#Construct a global grid with cells approximately 1000 miles across
dggs          <- dgconstruct(projection='ISEA', res=4, metric=FALSE, resround='down')

#Load included test data set
data <- read.xlsx(fil, sheetIndex=1)

#Get the corresponding grid cells for each earthquake epicenter (lat-long pair)
data$cell <- dgGEO_to_SEQNUM(dggs,data$plng,data$plat)$seqnum

#Converting SEQNUM to GEO gives the center coordinates of the cells
cellcenters <- dgSEQNUM_to_GEO(dggs,data$cell)

#Get the number of earthquakes in each cell
sam_counts <- data |> fcount(cell, name = "count")

#Get the grid cell boundaries for cells which had quakes
grid <- dgcellstogrid(dggs,sam_counts$cell)

#Update the grid cells' properties to include the number of earthquakes
#in each cell
grid <- merge(grid,sam_counts,by.x="seqnum",by.y="cell")

write.xlsx(data, fil, sheetName="Sheet2", append=TRUE)
write.xlsx(grid$seqnum, fil, sheetName="Sheet3", append=TRUE)
write.xlsx(grid$geometry, fil, sheetName="Sheet4", append=TRUE)


# fil <- paste("TOC_", ff, ".xlsx", sep="", collapse=NULL)
# 
# #Construct a global grid with cells approximately 1000 miles across
# dggs          <- dgconstruct(projection='ISEA', res=4, metric=FALSE, resround='down')
# 
# #Load included test data set
# data <- read.xlsx(fil, sheetIndex=1)
# 
# #Get the corresponding grid cells for each earthquake epicenter (lat-long pair)
# data$cell <- dgGEO_to_SEQNUM(dggs,data$plng,data$plat)$seqnum
# 
# #Converting SEQNUM to GEO gives the center coordinates of the cells
# cellcenters <- dgSEQNUM_to_GEO(dggs,data$cell)
# 
# #Get the number of earthquakes in each cell
# sam_counts <- data |> fcount(cell, name = "count")
# 
# #Get the grid cell boundaries for cells which had quakes
# grid <- dgcellstogrid(dggs,sam_counts$cell)
# 
# #Update the grid cells' properties to include the number of earthquakes
# #in each cell
# grid <- merge(grid,sam_counts,by.x="seqnum",by.y="cell")
# 
# write.xlsx(data, fil, sheetName="Sheet2", append=TRUE)
# write.xlsx(grid$seqnum, fil, sheetName="Sheet3", append=TRUE)
# write.xlsx(grid$geometry, fil, sheetName="Sheet4", append=TRUE)
# 
# 
# 
# fil <- paste("TS_", ff, ".xlsx", sep="", collapse=NULL)
# 
# #Construct a global grid with cells approximately 1000 miles across
# dggs          <- dgconstruct(projection='ISEA', res=4, metric=FALSE, resround='down')
# 
# #Load included test data set
# data <- read.xlsx(fil, sheetIndex=1)
# 
# #Get the corresponding grid cells for each earthquake epicenter (lat-long pair)
# data$cell <- dgGEO_to_SEQNUM(dggs,data$plng,data$plat)$seqnum
# 
# #Converting SEQNUM to GEO gives the center coordinates of the cells
# cellcenters <- dgSEQNUM_to_GEO(dggs,data$cell)
# 
# #Get the number of earthquakes in each cell
# sam_counts <- data |> fcount(cell, name = "count")
# 
# #Get the grid cell boundaries for cells which had quakes
# grid <- dgcellstogrid(dggs,sam_counts$cell)
# 
# #Update the grid cells' properties to include the number of earthquakes
# #in each cell
# grid <- merge(grid,sam_counts,by.x="seqnum",by.y="cell")
# 
# write.xlsx(data, fil, sheetName="Sheet2", append=TRUE)
# write.xlsx(grid$seqnum, fil, sheetName="Sheet3", append=TRUE)
# write.xlsx(grid$geometry, fil, sheetName="Sheet4", append=TRUE)
# 
# 
# 
# fil <- paste("P_", ff, ".xlsx", sep="", collapse=NULL)
# 
# #Construct a global grid with cells approximately 1000 miles across
# dggs          <- dgconstruct(projection='ISEA', res=4, metric=FALSE, resround='down')
# 
# #Load included test data set
# data <- read.xlsx(fil, sheetIndex=1)
# 
# #Get the corresponding grid cells for each earthquake epicenter (lat-long pair)
# data$cell <- dgGEO_to_SEQNUM(dggs,data$plng,data$plat)$seqnum
# 
# #Converting SEQNUM to GEO gives the center coordinates of the cells
# cellcenters <- dgSEQNUM_to_GEO(dggs,data$cell)
# 
# #Get the number of earthquakes in each cell
# sam_counts <- data |> fcount(cell, name = "count")
# 
# #Get the grid cell boundaries for cells which had quakes
# grid <- dgcellstogrid(dggs,sam_counts$cell)
# 
# #Update the grid cells' properties to include the number of earthquakes
# #in each cell
# grid <- merge(grid,sam_counts,by.x="seqnum",by.y="cell")
# 
# write.xlsx(data, fil, sheetName="Sheet2", append=TRUE)
# write.xlsx(grid$seqnum, fil, sheetName="Sheet3", append=TRUE)
# write.xlsx(grid$geometry, fil, sheetName="Sheet4", append=TRUE)



#Plot everything on a flat map

# Handle cells that cross 180 degrees
# wrapped_grid = st_wrap_dateline(grid, options = c("WRAPDATELINE=YES","DATELINEOFFSET=180"), quiet = TRUE)

#ggplot() +
#  geom_sf     (data=wrapped_grid, aes(fill=count), color=alpha("white", 0.4)) +
#  geom_point  (aes(x=cellcenters$lon_deg, y=cellcenters$lat_deg)) +
#  scale_fill_gradient(low="blue", high="red")