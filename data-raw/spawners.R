library(devtools)
library(magrittr)
library(dplyr)
library(lubridate)
library(sp)

spawners <- read.csv("data-raw/NSFish.csv", stringsAsFactors = TRUE)
spawners %<>% select(Date = NSDate, Spawners = NumFish)

spawners$Date %<>% as.character %>% parse_date_time(orders = "ymdHMS") %>% as.Date

spawners %<>% group_by(Date) %>% summarise(Spawners = sum(Spawners))

spawners$Year <- year(spawners$Date)
spawners$Year %<>% as.integer
year(spawners$Date) <- 2000

spawners %<>% select(Year, Dayte = Date, Spawners)
spawners %<>% arrange(Year, Dayte)

spawners %<>% as.data.frame
use_data(spawners, overwrite = TRUE)

transect <- read.csv("data-raw/transectutm.csv", stringsAsFactors = TRUE)

transect %<>% select(Location, long = Easting, lat = Northing)

transect <- SpatialPointsDataFrame(coords = select(transect, long, lat), data = select(transect, Location),
                               proj4string = CRS("+init=epsg:32611"))

transect %<>% spTransform(CRS("+init=epsg:3153"))

use_data(transect, overwrite = TRUE)
