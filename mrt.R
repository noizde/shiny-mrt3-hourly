library(ggplot2);
library(ggmap);

perHour <- read.csv("MRT3-DailyPassengerTrafficperHourperStationforCY2014.csv", header = TRUE);

mrtEntry <- split(perHour, f = perHour$Entry.Exit)$Entry;
mrtExity <- split(perHour, f = perHour$Entry.Exit)$Exit;

timeSlices <- mrtEntry[,1];

stationLocs <- read.csv("mrt3-station-coords.csv", header = TRUE);

stationNames <- names(perHour)[3:15];

mnl <- get_map(location=c(lon = 121.0536657, lat = 14.5811839), zoom = 12);

p <- ggmap(mnl);

p <- p + geom_point(data=stationLocs, aes(x = lon, y = lat, color = "red", size = 5));
p