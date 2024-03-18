library(tidyverse)
library(magrittr)
library(rvest)

myurl<-"https://en.wikipedia.org/wiki/List_of_countries_by_GDP_(nominal)"
myhtml <- read_html(myurl)
myhtml

mytable<-html_nodes(myhtml, "table") %>%  #Gets everything in the element
  html_table(fill=TRUE) #Convert to an R table, fill=TRUE is necessary when the website has multiple tables


mytable<-mytable %>% extract2(3) #since the website has multiple tables, we need to extract the 3rd one.


library(stringr)

mytable<-read_html(myurl) %>%
  html_nodes("table") %>%
  html_table(fill=TRUE)  %>%
  extract2(3) %>% #our table is actually nested within a list element [[]]
  select(Country=1, Year=4, GDP=3) %>%
  slice(3:214) %>%
  mutate( Year=str_remove(Year, ".*\\]"), #remove everything before the ]
          GDP=str_remove(GDP, ".*\\]"),
          GDP=parse_number(GDP), Year=parse_number(Year))


myurl<-"https://www.ola.org/en/members/parliament-43"

mpps<-read_html(myurl)%>%
  html_nodes("table")  %>% html_table(fill=TRUE) %>%
  extract2(1)
mpp_links<-read_html(myurl) %>%
  html_nodes("table") |> html_nodes("a")  %>% html_attr("href")
mpp_links<-mpp_links[3:132]

mpp1<-read_html(paste0("https://www.ola.org/",mpp_links[1])) %>%
  html_nodes(".views-field") %>%
  html_nodes("a") %>% html_attr("href")
mpp1[5]

mpp_data<-NULL
for (stub in mpp_links) {
  mpp1<-read_html(paste0("https://www.ola.org/",stub)) %>%
    html_nodes(".views-field") %>% html_nodes("a") %>%
    html_attr("href")
  name = str_remove(mpp1[2],"/en/members/all/")
  email= str_remove(mpp1[5],"mailto:")
  d<-cbind("name"=name, "email"=email)
  mpp_data<-rbind(mpp_data, d)
}

mpps |> mutate(lastname=str_extract(MPP, "\\d"))










