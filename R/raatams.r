## get bulk archived data, save bzip2 .rdata somewhere

## register individual sources aatams_sattag_nrt_profile_data etc.

## scan db for required updates (every day or so)

## methods to reconstruct as 3D tracks

## convert to trip / sp / SGAT etc.


installpath <- function(filename) {
  file.path(system.file("extdata", "rawdata", package = "raatams"), filename)
}



#' Title
#'
#' Currently only saves to raw file name.
#' @param tn
#' @param initial
#'
#' @return
bulkinitialdownload <- function(tn = NULL, initial = TRUE) {
  tn <- unique(c(tn, knownTypeNames()))
  report <- character(length(tn))
  for (i in seq_along(tn)) {
    localfile <- installpath(tn[i])
    if (!file.exists(localfile)) {
      bu <- burl(tn[i])
      report[i] <- try(download.file(bu, localfile, mode = "wb"))
    }
  }
  invisible(report)
}

knownTypeNames <- function() {
  c("aatams_sattag_nrt_profile_data")
}


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
