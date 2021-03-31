---
title: Data
---

# CAPSTONE DATA

* ## populatedPlaces
    * ne_10m_populated_places_Wisconsin.csv
    * Populated places data for Wisconsin extracted from the Natural Earth Data 1:10M populated places dataset
    * CSV format with latitude and longitude information
    * Populations derived from LandScan
* ## Precipitation
    * Seamless Daily Precipitation for the state of Wisconsin in shapefile format (polygon)
    * From The NRCS PRISM Climate Mapping Project
* ## Maxtemp_monthwarm_wi.tif
    * Data downloaded from WorldClim data using the raster package (getData("worldclim", var="bio", res=10)) and subset to Wisconsin.
    * Data temperatures have been scaled by 10.
    * This is calculated as the maximum temperature of the warmest month.
* ## Mintemp_monthcold_wi.tif
    * Data downloaded from WorldClim data using the raster package (getData("worldclim", var="bio", res=10)) and subset to Wisconsin.
    * Data temperatures have been scaled by 10.
    * This is calculated as the minimum temperature of the coldest month.
* ## Precip_annual_wi.tif
    * Data downloaded from WorldClim data using the raster package (getData("worldclim", var="bio", res=10)) and subset to Wisconsin.
    * This is calculated as annual precipitation.


## References:

* https://www.gis-blog.com/r-raster-data-acquisition/

* https://www.worldclim.org/

* https://www.naturalearthdata.com/downloads/10m-cultural-vectors/10m-populated-places/ 

* https://landscan.ornl.gov/ 

* https://www.wcc.nrcs.usda.gov/climate/prism.html 

## Code for creating mintemp/maxtemp/precipitation tifs:

```
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
createwiscraster <- function(bioclimlayer, counties, scalar){
    bioclimlayer <- bioclimlayer/scalar
    r2 <-crop(bioclimlayer, extent(counties))
    r3 <- mask(r2, counties)
    return(r3)
}

createcounties_dfs <- function(rasterlayer, counties_spdf){
    wiagg <- raster::extract(x=rasterlayer, y=counties_spdf,df=TRUE)
    wiaggout <- merge(counties_wi_spdf, wiagg, by.x="countyIDnum", by.y="ID",duplicateGeoms=TRUE)
    return(wiaggout@data)
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
maxtemp_monthwarm_wi <- createwiscraster(clim1$bio5, counties_wi, scalar = 10)
mintemp_monthcold_wi <- createwiscraster(clim1$bio6, counties_wi, scalar = 10)
precip_annual_wi <- createwiscraster(clim1$bio12, counties_wi,scalar=1)

#save rasters as geotiffs
writeRaster(maxtemp_monthwarm_wi, "../data/maxtemp_monthwarm_wi.tif", overwrite=TRUE)
writeRaster(mintemp_monthcold_wi, "../data/mintemp_monthcold_wi.tif", overwrite=TRUE)
writeRaster(precip_annual_wi, "../data/precip_annual_wi.tif", overwrite=TRUE)
```

{% include carpentries.html %}
{% include links.md %}
