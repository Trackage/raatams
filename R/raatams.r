## get bulk archived data, save bzip2 .rdata somewhere

## register individual sources aatams_sattag_nrt_profile_data etc.

## scan db for required updates (every day or so)

## methods to reconstruct as 3D tracks

## convert to trip / sp / SGAT etc.



#' Title
#'
#' Example typeName = aatams_sattag_nrt_profile_data
#' @param typeName
#'
#' @return character string URL
burl <- function(typeName) {
  bu <- "http://geoserver-123.aodn.org.au/geoserver/ows?typeName=%s&SERVICE=WFS&outputFormat=csv&REQUEST=GetFeature&VERSION=1.0.0"
  sprintf(bu, typeName)
}
