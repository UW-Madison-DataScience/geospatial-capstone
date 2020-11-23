#R Code Exploring bioclim data for Wisconsin at county-level from `raster` package:
#M.Kamenetsky
#2020-11
##load packages
library(raster)
library(maps)
library(sf)
library(dplyr)
library(tidyr)

#helper function
createwiscraster <- function(bioclimlayer, counties){
    r2 <-crop(bioclimlayer, extent(counties))
    r3 <- mask(r2, counties)
    return(r3)
}

createcounties_dfs <- function(rasterlayer, counties_spdf){
    wiagg <- raster::extract(x=rasterlayer, y=counties_spdf, fun=mean, df=TRUE)
    wiagg$poly_ID<- counties_wi_spdf$county
    return(wiagg)
}
############################################################################
#Get Data
#get US counties map
counties <- st_as_sf(map("county", plot=FALSE, fill=TRUE))
#select out WI
counties_wi <- counties %>%
    tidyr::separate(ID, c("state", "county")) %>%
    filter(state=="wisconsin")

#get worldclim data
clim1 <- getData("worldclim", var="bio", res=10)
#vars to keep:
#bio5: max temp warmest month
#bio6: min temp coldest month
#bio12: annual precipitation

############################################################################
#select, clean, save rasters
maxtemp_monthwarm_wi <- createwiscraster(clim1$bio5, counties_wi)
mintemp_monthcold_wi <- createwiscraster(clim1$bio6, counties_wi)
precip_annual_wi <- createwiscraster(clim1$bio12, counties_wi)

#save rasters as geotiffs
writeRaster(maxtemp_monthwarm_wi, "../data/maxtemp_monthwarm_wi.tif")
writeRaster(mintemp_monthcold_wi, "../data/mintemp_monthcold_wi.tif")
writeRaster(precip_annual_wi, "../data/precip_annual_wi.tif")

############################################################################
#Map raster cells to a county; save as csv
#create csv assigning cells to counties
counties_wi_spdf <- as(counties_wi, 'Spatial')
maxtemp <- createcounties_dfs(maxtemp_monthwarm_wi, counties_wi_spdf)
mintemp <- createcounties_dfs(mintemp_monthcold_wi, counties_wi_spdf)
precip <- createcounties_dfs(precip_annual_wi, counties_wi_spdf)

#combine into 1 df and clean up
county_rastercells <- maxtemp
county_rastercells$maxtemp_monthwarm <- county_rastercells$bio5
county_rastercells$mintemp_monthcold <- mintemp$bio6
county_rastercells$precip_annual <- precip$bio12
county_rastercells$county <- county_rastercells$poly_ID
#remove old vars
county_rastercells$bio5 <- NULL
county_rastercells$ID <- NULL
county_rastercells$poly_ID <- NULL
#save csv

write.csv(county_rastercells, file="../data/county_rastercells.csv", row.names = FALSE)
