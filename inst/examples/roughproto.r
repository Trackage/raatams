u <- "http://geoserver-123.aodn.org.au/geoserver/ows?typeName=aatams_sattag_nrt_profile_data&SERVICE=WFS&outputFormat=csv&REQUEST=GetFeature&VERSION=1.0.0&CQL_FILTER=timestamp%20%3E%3D%20'2015-12-31T13%3A00%3A00Z'"
u <- "http://geoserver-123.aodn.org.au/geoserver/ows?typeName=aatams_sattag_nrt_profile_data&SERVICE=WFS&outputFormat=csv&REQUEST=GetFeature&VERSION=1.0.0"
u <- "http://geoserver-123.aodn.org.au/geoserver/ows?typeName=aatams_sattag_nrt_profile_data&SERVICE=WFS&outputFormat=shape-zip&REQUEST=GetFeature&VERSION=1.0.0"

library(readr)
#download.file(u, "imos.csv", mode = "wb")
download.file(u, "shape.zip", mode = "wb")
x <- read_csv("imos.csv")
library(dplyr)
library(trip)
x <- as.data.frame(x)
x1 <- x[!duplicated(x[, c("timestamp", "device_wmo_ref")]), ]

x1 <- x1[order(x1$device_wmo_ref, x1$timestamp), ]
coordinates(x1) <- c("lon", "lat")
tr <- trip(x1, c("timestamp", "device_wmo_ref"))
plot(tr); lines(tr)
proj4string(tr) <- CRS("+proj=longlat +ellps=WGS84")
library(rgdal)
tr2 <- spTransform(tr, "+proj=laea +lat_0=-70 +lon_0=120")
plot(tr2, col = "white")
lines(tr2)
library(maptools)
data(wrld_simpl)
xx <- spbabel::sptable(wrld_simpl)
w <- project(as.matrix(xx[, c("x", "y")]), proj4string(tr2))
points(w, pch = ".")

