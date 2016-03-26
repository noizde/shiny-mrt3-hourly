library(ggplot2);
library(ggmap);
library(shiny);

perHour <- read.csv("MRT3-DailyPassengerTrafficperHourperStationforCY2014.csv", header = TRUE);

mrtEntry <- t(split(perHour, f = perHour$Entry.Exit)$Entry[,3:15]);
mrtExit  <- t(split(perHour, f = perHour$Entry.Exit)$Exit[,3:15]);

timeSlices <- as.list(perHour[,1]);
names(timeSlices) <- as.character(perHour[,1]);

stationLocs <- read.csv("mrt3-station-coords.csv", header = TRUE);
stationNames <- names(perHour)[3:15];

mnl <- get_map(location=c(lon = 121.0536657, lat = 14.5811839), zoom = 12, scale = "auto");