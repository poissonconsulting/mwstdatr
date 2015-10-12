library(devtools)
library(magrittr)
library(dplyr)
library(lubridate)

gsi <- read.csv("data-raw/Fish.csv", stringsAsFactors = TRUE)

gsi %<>% filter(Sex %in% c("F", "M")) %>%
  filter(Condition %in% c("A", "B", "R"))

gsi %<>% select(Date = Fish_Date, CaptureMethod = Capture.Method,
                 ForkLength = Length, BodyMass = Body_Weight,
                 StomachMass = Stomach_Wt, GonadalMass = Gonad_Weight,
                 Sex)

levels(gsi$CaptureMethod) <- list(Angling = "AG", Electrofishing = "EF")
levels(gsi$Sex) <- list(Male = "M", Female = "F")
gsi$ForkLength %<>% as.integer

gsi$Date %<>% as.character %>% parse_date_time(orders = "ymdHMS") %>% as.Date

gsi %<>% filter(month(Date) > 6)

gsi$Year <- year(gsi$Date)
gsi$Year %<>% as.integer
year(gsi$Date) <- 2000

gsi %<>% mutate(GSI = GonadalMass / (BodyMass - StomachMass))

gsi %<>% select(Year, Dayte = Date, CaptureMethod, Sex,
                 ForkLength, BodyMass,
                 StomachMass, GonadalMass, GSI)

gsi %<>% arrange(Year, Dayte, CaptureMethod, Sex, ForkLength, BodyMass,
                 StomachMass, GonadalMass)

gsi %<>% as.data.frame

use_data(gsi, overwrite = TRUE)
