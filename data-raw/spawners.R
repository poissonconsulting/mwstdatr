library(devtools)
library(magrittr)
library(dplyr)
library(lubridate)

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
