#' Egg Mat Data
#'
#' For Mountain Whitefish from the Lower Duncan River, British Columbia.
#'
#' @format A data.frame:
#' \describe{
#'   \item{Year}{The year of deployment as an integer.}
#'   \item{Dayte}{The day of the year of deployment as a Date.}
#'   \item{Mats}{The number of egg mats deployed as an integer.}
#'   \item{Days}{The number of days the mats were deployed as an integer.}
#'   \item{Eggs}{The number of eggs collected as an integer.}
#' }
"eggs"

#' Spawner Count Data
#'
#' For Mountain Whitefish from the Lower Duncan River, British Columbia.
#'
#' @format A data.frame:
#' \describe{
#'   \item{Year}{The observation year as an integer.}
#'   \item{Dayte}{The day of the year of the observation as a Date.}
#'   \item{Spawners}{The number of spawners observed as an integer.}
#' }
"spawners"

#' GSI Data
#'
#' For Mountain Whitefish from the Lower Duncan River, British Columbia.
#'
#' @format A data.frame:
#' \describe{
#'   \item{Year}{The year of capture as an integer.}
#'   \item{Dayte}{The day of the year of capture as a Date.}
#'   \item{CaptureMethod}{The method of capture as a factor.}
#'   \item{ForkLength}{The fish's fork length (in mm) as an integer.}
#'   \item{BodyMass}{The fish's wet body mass (in g) as a numeric.}
#'   \item{StomachMass}{The fish's wet stomach mass (in g) as a numeric.}
#'   \item{GonadalMass}{The fish's wet gonadal mass (in g) as a numeric.}
#'   \item{Sex}{The fish's sex as a factor with two levels: Male and Female.}
#'   \item{GSI}{The fish's Gonadal Somatic Index as a numeric.}
#' }
"gsi"

#' Lower Duncan River
#'
#' From the BC Freshwater Atlas (manually corrected).
#'
#' @format A SpatialPolygons object of the Lower Duncan River, British
#' Columbia.
#' The projection is EPSG:3153
"ldr"

#' Kootenay Lake
#'
#' From the BC Freshwater Atlas (manually corrected).
#'
#' @format A SpatialPolygons object of Kootenay Lake, British
#' Columbia.
#' The projection is EPSG:3153
"kootenay"

#' Duncan Reservoir
#'
#' From the BC Freshwater Atlas.
#'
#' @format A SpatialPolygons object of Duncan Reservoir, British
#' Columbia.
#' The projection is EPSG:3153
"duncan"

#' Lardeau River
#'
#' From the BC Freshwater Atlas.
#'
#' @format A SpatialPolygons object of the Lardeau River, British
#' Columbia.
#' The projection is EPSG:3153
"lardeau"

#' Mats
#'
#' @format A SpatialPointsDataFrame object of the egg mat sites on the Lower Duncan River, British
#' Columbia.
#' The projection is EPSG:3153
"mats"
