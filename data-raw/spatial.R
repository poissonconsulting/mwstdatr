library(kootfwa)
library(rgeos)
library(rgdal)
library(raster)
library(magrittr)
library(devtools)

duncan <- readOGR(dsn = "data-raw/fwa/duncan.kml", layer = "SpatialPolygonsDataFrame")
kootenay <- readOGR(dsn = "data-raw/fwa/kootenay-corrected.kml", layer = "SpatialPolygonsDataFrame")
lardeau <- readOGR(dsn = "data-raw/fwa/lardeau.kml", layer = "SpatialPolygonsDataFrame")
ldr <- readOGR(dsn = "data-raw/fwa/ldr-corrected.kml", layer = "SpatialPolygonsDataFrame")

duncan %<>% spTransform(CRS("+init=epsg:3153"))
kootenay %<>% spTransform(CRS("+init=epsg:3153"))
lardeau %<>% spTransform(CRS("+init=epsg:3153"))
ldr %<>% spTransform(CRS("+init=epsg:3153"))

process_kml <- function(sp) {

  polygons <- list()
  for (i in seq_len(length(sp@polygons))) {
    polygons[[i]] <-  Polygon(sp@polygons[[i]]@Polygons[[1]]@coords, hole = !identical(i,1))
  }
  polygons %<>% Polygons(ID = "polygon") %>% list() %>%
    SpatialPolygons(proj4string = CRS(proj4string(sp)))
  polygons
}

duncan %<>% process_kml()
kootenay %<>% process_kml()
lardeau %<>% process_kml()
ldr %<>% process_kml()


use_data(duncan, overwrite = TRUE)
use_data(kootenay, overwrite = TRUE)
use_data(lardeau, overwrite = TRUE)
use_data(ldr, overwrite = TRUE)
