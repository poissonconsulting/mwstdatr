library(devtools)
library(magrittr)
library(dplyr)
library(lubridate)

eggs <- read.csv("data-raw/Mat_Sample.csv", stringsAsFactors = TRUE)

eggs$Bank %<>% substr(1, 1)

eggs %<>% mutate(Site = paste0(RiverKm, Bank))

eggs %<>% select(Site, Eggs = No_Eggs, Deployed = DateTimeDeploy,
                Retrieved = DateTimeRetrieve)

eggs$Deployed %<>% as.character %>% parse_date_time(orders = "ymdHMS", tz = "PST8PDT")
eggs$Retrieved %<>% as.character %>% parse_date_time(orders = "ymdHMS", tz = "PST8PDT")
eggs %<>% mutate(Date = as.Date(Deployed), Days =  difftime(eggs$Retrieved, eggs$Deployed, "days"))
eggs$Days %<>% as.numeric

egg_days <- function (x) {
  data.frame(Eggs = sum(x$Eggs), Days = sum())
}

eggs %<>% group_by(Date) %>% summarise(Mats = n(), Eggs = sum(Eggs), Days = round(mean(Days)))
eggs$Days %<>% as.integer

eggs$Year <- year(eggs$Date)
eggs$Year %<>% as.integer
year(eggs$Date) <- 2000

eggs %<>% select(Year, Dayte = Date, Mats, Days, Eggs)
eggs %<>% arrange(Year, Dayte)

eggs %<>% as.data.frame
use_data(eggs, overwrite = TRUE)
