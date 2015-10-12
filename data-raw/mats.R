library(devtools)
library(magrittr)
library(dplyr)
library(lubridate)
library(sp)

mats <- read.csv("data-raw/eggmatutm.csv", stringsAsFactors = TRUE)

mats %<>% mutate(Site = paste0(RiverKm, Bank)) %>% select(Site, long = Easting, lat = Northing)

mats <- SpatialPointsDataFrame(coords = select(mats, long, lat), data = select(mats, Site),
                       proj4string = CRS("+init=epsg:32611"))

mats %<>% spTransform(CRS("+init=epsg:3153"))

mats@data$RiverKm <- format(as.numeric(sub("(.*)((C|L|R)$)", "\\1", mats@data$Site)), nsmall = 1)

use_data(mats, overwrite = TRUE)
