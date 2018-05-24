
#list.files()
library (raster)
file = "./DG1000_masked.tif"
dem = raster(file)
extent(dem)

NAvalue(dem) = 0

library(rasterVis)
theme = rasterTheme # verschiedene Farbthemen
#theme = GrTheme
levelplot(dem, layers = 1,contour = FALSE, par.settings = theme)

download.file("http://geography-ahc.uibk.ac.at/Data/SFCwrfout_d03_1980-2009_T2_monmean.grd", 
              destfile = "./SFCwrfout_d03_1980-2009_T2_monmean.grd")


library(ncdf4)
ncin = nc_open ("./SFCwrfout_d03_1980-2009_T2_monmean.grd")
ncin

lon2d = ncvar_get (ncin, "XLONG")
head (lon2d)


lat2d = ncvar_get (ncin, "XLAT")
head(lat2d)

time = ncvar_get (ncin, "Times")
time
