latlon_latxlonx <- function(tlatidx=25,
                            tlonidx=46,
                            latneed = 40.0628,
                            lonneed = -88.1961) {
  # This comes from the params file
  #simulation delta
  latdelta <- 0.5 # minutes
  londelta <- 0.5 # minutes
  # Tile deltas and indices
  tlatdelta <- 120
  tlondelta <- 120
  ## USER EDIT: what are the associated lat and long degree boundaries of these tiles?
  lats = c(40,42)
  lons = c(-90,-88)
  split      = 1
  slatidx    = 1
  slonidx    = 1
  tslatdelta = tlatdelta / split
  tslondelta = tlondelta / split
  tslatidx   = split * (tlatidx - 1) + slatidx
  tslonidx   = split * (tlonidx - 1) + slonidx
  latlines = rev(seq(lats[1], lats[2], length.out = tslatdelta / latdelta + 1))
  lonlines = seq(lons[1], lons[2], length.out = tslondelta / londelta + 1)
  # find i and j
  latdiffs = latlines - latneed
  min = min(latdiffs[which(latdiffs > 0)])
  i = which(latdiffs == min)
  londiffs = lonlines - lonneed
  min = max(londiffs[which(londiffs < 0)])
  j = which(londiffs == min)
  # Subtile deltas and indices
  latidx = ceiling((tlatdelta * (tlatidx - 1) + tslatdelta * (slatidx - 1) + latdelta * i) / latdelta)
  lonidx = ceiling((tlondelta * (tlonidx - 1) + tslondelta * (slonidx - 1) + londelta * j) / londelta)
  return(data.frame(latid=latidx, lonid=lonidx))
}
