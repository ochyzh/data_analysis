library(tidyverse)
library(mapproj)
library(maps)
library(mapdata)
states <- map_data("state")
head(states)
library(ggplot2)
ggplot() +  geom_path(data=states, aes(x=long, y=lat, group=group),color="black", size=.5)
#Set theme options:
theme_set(theme_grey() + theme(axis.text=element_blank(),
                               axis.ticks=element_blank(),
                               axis.title.x=element_blank(),
                               axis.title.y=element_blank(),
                               panel.grid.major = element_blank(),
                               panel.grid.minor = element_blank(),
                               panel.border = element_blank(),
                               panel.background = element_blank(),
                               legend.position="none"))
ggplot() +  geom_path(data=states, aes(x=long, y=lat, group=group),color="black", size=.5)+ coord_map()
statereg<- read.csv("./data/statereg.csv")
head(statereg)
states.class.map <- left_join(states, statereg, by = c("region" = "State"))
head(states.class.map)
library(devtools)
install_github("mccormackandrew/mapcan", build_vignettes = TRUE)
library(mapcan)
canada_map<-mapcan(boundaries = "province", type="standard",territories=TRUE)
head(canada_map)
ggplot(canada_map, aes(long, lat, group = group)) +
  geom_polygon(color="black", fill="white")
data("federal_election_results")
federal_election_results %>% as.data.frame() %>%
  dplyr::filter(election_year=="2015")->electdata

animal<- read.csv("./data/animal.csv")

library(leaflet)
leaflet() |> addTiles() |>
  addCircleMarkers(animal$Longitude,animal$Latitude, radius=1)








