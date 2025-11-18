library(tidyverse)
library(mapproj)
library(maps)
library(mapdata)
library(devtools)
install_github("mccormackandrew/mapcan", build_vignettes = TRUE)
library(mapcan)
library(ggplot2)



states <- map_data("state")
head(states)

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
ggplot() +  geom_polygon(data=states.class.map, aes(x=long, y=lat, group=group, fill = StateGroups), colour = I("black"))+ coord_map()+theme(legend.position="bottom")

canada_map<-mapcan(boundaries = "province", type="standard",territories=TRUE)
head(canada_map)
ggplot(canada_map, aes(long, lat, group = group)) +
  geom_polygon(color="black", fill="white")

data("federal_election_results")
federal_election_results %>% as.data.frame() %>%
  dplyr::filter(election_year=="2015")->electdata

canada_ridings<-mapcan(boundaries = "ridings", type="standard",territories=TRUE)
head(canada_ridings)
canada_ridings %>% left_join(electdata, by="riding_code") %>%
  ggplot(aes(long, lat, group = group, fill=factor(party)))+
  geom_polygon(color="black") +scale_fill_discrete("Party", type="qual") + theme(legend.position="bottom")

#Your Turn:











