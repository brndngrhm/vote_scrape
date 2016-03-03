#vote scarping 

#pakages ----
library(dplyr)
library(ggplot2)
library(ggthemes)
library(rvest)

#minnesota ----
minn <- "http://www.politico.com/2016-election/results/map/president/minnesota"
dem.dist.1 <- as.data.frame(minn %>% html() %>% html_nodes(xpath = '//*[@id="county1stDistrict"]/div/div/div[1]/table') %>% html_table())
rep.dist.1 <- as.data.frame(minn %>% html() %>% html_nodes(xpath = '//*[@id="county1stDistrict"]/div/div/div[2]/table') %>% html_table())
dist.1 <- rbind(dem.dist.1, rep.dist.1)
dist.1$district <- "1"

dem.dist.2 <- as.data.frame(minn %>% html() %>% html_nodes(xpath = '//*[@id="county2ndDistrict"]/div/div/div[1]/table') %>% html_table())
rep.dist.2 <- as.data.frame(minn %>% html() %>% html_nodes(xpath = '//*[@id="county2ndDistrict"]/div/div/div[2]/table') %>% html_table())
dist.2 <- rbind(dem.dist.2, rep.dist.2)
dist.2$district <- "2"

dem.dist.3 <- as.data.frame(minn %>% html() %>% html_nodes(xpath = '//*[@id="county3rdDistrict"]/div/div/div[1]/table') %>% html_table())
rep.dist.3 <- as.data.frame(minn %>% html() %>% html_nodes(xpath = '//*[@id="county3rdDistrict"]/div/div/div[2]/table') %>% html_table())
dist.3 <- rbind(dem.dist.3, rep.dist.3)
dist.3$district <- "3"

dem.dist.4 <- as.data.frame(minn %>% html() %>% html_nodes(xpath = '//*[@id="county4thDistrict"]/div/div/div[1]/table') %>% html_table())
rep.dist.4 <- as.data.frame(minn %>% html() %>% html_nodes(xpath = '//*[@id="county4thDistrict"]/div/div/div[2]/table') %>% html_table())
dist.4 <- rbind(dem.dist.4, rep.dist.4)
dist.4$district <- "4"

dem.dist.5 <- as.data.frame(minn %>% html() %>% html_nodes(xpath = '//*[@id="county5thDistrict"]/div/div/div[1]/table') %>% html_table())
rep.dist.5 <- as.data.frame(minn %>% html() %>% html_nodes(xpath = '//*[@id="county5thDistrict"]/div/div/div[2]/table') %>% html_table())
dist.5 <- rbind(dem.dist.5, rep.dist.5)
dist.5$district <- "5"

dem.dist.6 <- as.data.frame(minn %>% html() %>% html_nodes(xpath = '//*[@id="county6thDistrict"]/div/div/div[1]/table') %>% html_table())
rep.dist.6 <- as.data.frame(minn %>% html() %>% html_nodes(xpath = '//*[@id="county6thDistrict"]/div/div/div[2]/table') %>% html_table())
dist.6 <- rbind(dem.dist.6, rep.dist.6)
dist.6$district <- "6"

dem.dist.7 <- as.data.frame(minn %>% html() %>% html_nodes(xpath = '//*[@id="county7thDistrict"]/div/div/div[1]/table') %>% html_table())
rep.dist.7 <- as.data.frame(minn %>% html() %>% html_nodes(xpath = '//*[@id="county7thDistrict"]/div/div/div[2]/table') %>% html_table())
dist.7 <- rbind(dem.dist.7, rep.dist.7)
dist.7$district <- "7"

dem.dist.8 <- as.data.frame(minn %>% html() %>% html_nodes(xpath = '//*[@id="county8thDistrict"]/div/div/div[1]/table') %>% html_table())
rep.dist.8 <- as.data.frame(minn %>% html() %>% html_nodes(xpath = '//*[@id="county8thDistrict"]/div/div/div[2]/table') %>% html_table())
dist.8 <- rbind(dem.dist.8, rep.dist.8)
dist.8$district <- "8"

minn <- rbind(dist.1, dist.2, dist.3, dist.4, dist.5, dist.6, dist.7, dist.8)
names(minn)[1] <- "candidate"
names(minn)[2] <- "percent"
names(minn)[3] <- "count"
minn$percent <- sub('%$', '', minn$percent) #removing "%"
minn$count <- sub(',', '', minn$count) #removing ","
minn$percent <- as.numeric(minn$percent)
minn$percent <- minn$percent/100
minn$count <- as.numeric(minn$count)
write.csv(minn, file = "C:/Users/GRA/Desktop/Misc/R Working Directory/Other/vote_scrape/minn.csv")
