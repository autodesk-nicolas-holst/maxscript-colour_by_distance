# maxscript-colour_by_distance

loops through all objects based on a certain prefix then loops through all frames and sets a key on the diffuse colour of the material (will create a standard material in case the material is missing)

parameters:

* prefix
* start frame
* end frame
* minimum distance (below which the colour will be set to red)
* maximum distance (beyond which the colour will be set to green)
  between those two i'll interpolate between red and green
