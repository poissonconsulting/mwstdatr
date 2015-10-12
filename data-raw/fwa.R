library(kootfwa)
library(raster)
library(maptools)
library(plotKML)
library(magrittr)

lakes <- fwa_layer("lakes", ws_codes = c("DUNC", "KOTL"))
rivers <- fwa_layer("rivers", ws_codes = c("DUNC"))

kootenay <- lakes[lakes@data$GNSNM1 == "Kootenay Lake",]
duncan <- lakes[lakes@data$GNSNM1 == "Duncan Lake",]

lardeau <- rivers[grepl("300-625474-096683-076865-00000", rivers@data$FWWTRSHDCD),]

ldr <- rivers[grepl("300-625474-096683-00000", rivers@data$FWWTRSHDCD),]
ldr <- ldr[!ldr@data$OBJECTID %in% c(51878, 52117),]

e1 <- as(raster::extent(1641000, 1647250, 613000, 624250), 'SpatialPolygons')
raster::projection(e1) <- raster::projection(ldr)

ldr %<>% raster::intersect(e1)

kootenay %<>% maptools::unionSpatialPolygons(IDs = rep(1, nrow(slot(., "data"))))
duncan %<>% maptools::unionSpatialPolygons(IDs = rep(1, nrow(slot(., "data"))))
lardeau %<>% maptools::unionSpatialPolygons(IDs = rep(1, nrow(slot(., "data"))))
ldr %<>% maptools::unionSpatialPolygons(IDs = rep(1, nrow(slot(., "data"))))

# as kml requires SpatialPolygonsDataFrame
kootenay %<>% SpatialPolygonsDataFrame(data = data.frame(Data = "data"))
duncan %<>% SpatialPolygonsDataFrame(data = data.frame(Data = "data"))
lardeau %<>% SpatialPolygonsDataFrame(data = data.frame(Data = "data"))
ldr %<>% SpatialPolygonsDataFrame(data = data.frame(Data = "data"))

dir.create("data-raw/fwa", showWarnings = FALSE)

kml(duncan, "duncan", "data-raw/fwa/duncan.kml", colour = "blue", alpha = 0.25)
kml(kootenay, "kootenay", "data-raw/fwa/kootenay.kml", colour = "blue", alpha = 0.25)
kml(lardeau, "lardeau", "data-raw/fwa/lardeau.kml", colour = "blue", alpha = 0.25)
kml(ldr, "ldr", "data-raw/fwa/ldr.kml", colour = "blue", alpha = 0.25)
