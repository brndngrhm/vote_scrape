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

#Iowa ----

iowa <- "http://www.politico.com/2016-election/results/map/president/iowa"
Adair.dem <- as.data.frame(iowa %>% html() %>% html_nodes(xpath = '//*[@id="countyAdair"]/div/div/div[1]/table') %>% html_table())
Adair.rep <- as.data.frame(iowa %>% html() %>% html_nodes(xpath = '//*[@id="countyAdair"]/div/div/div[2]/table') %>% html_table())
Adair.dist <- rbind(Adair.dem, Adair.rep)
Adair.dist$iowa.district <- "Adair"

Adams.dem <- as.data.frame(iowa %>% html() %>% html_nodes(xpath = '//*[@id="countyAdams"]/div/div/div[1]/table') %>% html_table())
Adams.rep <- as.data.frame(iowa %>% html() %>% html_nodes(xpath = '//*[@id="countyAdams"]/div/div/div[2]/table') %>% html_table())
Adams.dist <- rbind(Adams.dem, Adams.rep)
Adams.dist$iowa.district <- "Adams"

Allamakee.dem <- as.data.frame(iowa %>% html() %>% html_nodes(xpath = '//*[@id="countyAllamakee"]/div/div/div[1]/table') %>% html_table())
Allamakee.rep <- as.data.frame(iowa %>% html() %>% html_nodes(xpath = '//*[@id="countyAllamakee"]/div/div/div[2]/table') %>% html_table())
Allamakee.dist <- rbind(Allamakee.dem, Allamakee.rep)
Allamakee.dist$iowa.district <- "Allamakee"

Appanoose.dem <- as.data.frame(iowa %>% html() %>% html_nodes(xpath = '//*[@id="countyAppanoose"]/div/div/div[1]/table') %>% html_table())
Appanoose.rep <- as.data.frame(iowa %>% html() %>% html_nodes(xpath = '//*[@id="countyAppanoose"]/div/div/div[2]/table') %>% html_table())
Appanoose.dist <- rbind(Appanoose.dem, Appanoose.rep)
Appanoose.dist$iowa.district <- "Appanoose"

Benton.dem <- as.data.frame(iowa %>% html() %>% html_nodes(xpath = '//*[@id="countyBenton"]/div/div/div[1]/table') %>% html_table())
Benton.rep <- as.data.frame(iowa %>% html() %>% html_nodes(xpath = '//*[@id="countyBenton"]/div/div/div[2]/table') %>% html_table())
Benton.dist <- rbind(Benton.dem, Benton.rep)
Benton.dist$iowa.district <- "Benton"

BlackHawk.dem <- as.data.frame(iowa %>% html() %>% html_nodes(xpath = '//*[@id="countyBlackHawk"]/div/div/div[1]/table') %>% html_table())
BlackHawk.rep <- as.data.frame(iowa %>% html() %>% html_nodes(xpath = '//*[@id="countyBlackHawk"]/div/div/div[1]/table') %>% html_table())
BlackHawk.dist <- rbind(BlackHawk.dem, BlackHawk.rep)
BlackHawk.dist$iowa.district <- "BlackHawk "

Boone.dem <- as.data.frame(iowa %>% html() %>% html_nodes(xpath = '//*[@id="countyBoone"]/div/div/div[1]/table') %>% html_table())
Boone.rep <- as.data.frame(iowa %>% html() %>% html_nodes(xpath = '//*[@id="countyBoone"]/div/div/div[2]/table') %>% html_table())
Boone.dist <- rbind(Boone.dem, Boone.rep)
Boone.dist$iowa.district <- "Boone  "

Bremer.dem <- as.data.frame(iowa %>% html() %>% html_nodes(xpath = '//*[@id="countyBremer"]/div/div/div[1]/table') %>% html_table())
Bremer.rep <- as.data.frame(iowa %>% html() %>% html_nodes(xpath = '//*[@id="countyBremer"]/div/div/div[2]/table') %>% html_table())
Bremer.dist <- rbind(Bremer.dem, Bremer.rep)
Bremer.dist$iowa.district <- "Bremer"

Buchanan.dem <- as.data.frame(iowa %>% html() %>% html_nodes(xpath = '//*[@id="countyBuchanan"]/div/div/div[1]/table') %>% html_table())
Buchanan.rep <- as.data.frame(iowa %>% html() %>% html_nodes(xpath = '//*[@id="countyBuchanan"]/div/div/div[2]/table') %>% html_table())
Buchanan.dist <- rbind(Buchanan.dem, Buchanan.rep)
Buchanan.dist$iowa.district <- "Buchanan"

#problem
BuenaVista.dem <- as.data.frame(iowa %>% html() %>% html_nodes(xpath = '//*[@id="countyBuenaVista"]/div/div/div[1]/table') %>% html_table())
BuenaVista.rep <- as.data.frame(iowa %>% html() %>% html_nodes(xpath = '//*[@id="countyBuenaVista"]/div/div/div[2]/table') %>% html_table())
BuenaVista.dist <- rbind(BuenaVista.dem, BuenaVista.rep)
BuenaVista.dist$iowa.district <- "BuenaVista"

#problem
Butler.dem <- as.data.frame(iowa %>% html() %>% html_nodes(xpath = '//*[@id="countyButler"]/div/div/div[1]/table') %>% html_table())
Butler.rep <- as.data.frame(iowa %>% html() %>% html_nodes(xpath = '//*[@id="countyButler"]/div/div/div[2]/table') %>% html_table())
Butler.dist <- rbind(Butler.dem, Butler.rep)
Butler.dist$iowa.district <- "Butler"

Calhoun.dem <- as.data.frame(iowa %>% html() %>% html_nodes(xpath = '//*[@id="countyCalhoun"]/div/div/div[1]/table') %>% html_table())
Calhoun.rep <- as.data.frame(iowa %>% html() %>% html_nodes(xpath = '//*[@id="countyCalhoun"]/div/div/div[2]/table') %>% html_table())
Calhoun.dist <- rbind(Calhoun.dem, Calhoun.rep)
Calhoun.dist$iowa.district <- "Calhoun"

#colorado ----
co <- "http://www.politico.com/2016-election/results/map/president/colorado"

Adams.dem <- as.data.frame(co %>% html() %>% html_nodes(xpath = '//*[@id="countyAdams"]/div/div/div[1]/table') %>% html_table())
Adams.rep <- as.data.frame(co %>% html() %>% html_nodes(xpath = '//*[@id="countyAdams"]/div/div/div[2]/table') %>% html_table())
Adams.dist <- rbind(Adams.dem, Adams.rep)
Adams.dist$co.district <- "Adams"

Alamosa.dem <- as.data.frame(co %>% html() %>% html_nodes(xpath = '//*[@id="countyAlamosa"]/div/div/div[1]/table') %>% html_table())
Alamosa.rep <- as.data.frame(co %>% html() %>% html_nodes(xpath = '//*[@id="countyAlamosa"]/div/div/div[2]/table') %>% html_table())
Alamosa.dist <- rbind(Alamosa.dem, Alamosa.rep)
Alamosa.dist$co.district <- "Alamosa"

Arapahoe.dem <- as.data.frame(co %>% html() %>% html_nodes(xpath = '//*[@id="countyArapahoe"]/div/div/div[1]/table') %>% html_table())
Arapahoe.rep <- as.data.frame(co %>% html() %>% html_nodes(xpath = '//*[@id="countyArapahoe"]/div/div/div[2]/table') %>% html_table())
Arapahoe.dist <- rbind(Arapahoe.dem, Arapahoe.rep)
Arapahoe.dist$co.district <- "Arapahoe"

Archuleta.dem <- as.data.frame(co %>% html() %>% html_nodes(xpath = '//*[@id="countyArchuleta"]/div/div/div[1]/table') %>% html_table())
Archuleta.rep <- as.data.frame(co %>% html() %>% html_nodes(xpath = '//*[@id="countyArchuleta"]/div/div/div[2]/table') %>% html_table())
Archuleta.dist <- rbind(Archuleta.dem, Archuleta.rep)
Archuleta.dist$co.district <- "Archuleta"

Baca.dem <- as.data.frame(co %>% html() %>% html_nodes(xpath = '//*[@id="countyBaca"]/div/div/div[1]/table') %>% html_table())
Baca.rep <- as.data.frame(co %>% html() %>% html_nodes(xpath = '//*[@id="countyBaca"]/div/div/div[2]/table') %>% html_table())
Baca.dist <- rbind(Baca.dem, Baca.rep)
Baca.dist$co.district <- "Baca"

Bent.dem <- as.data.frame(co %>% html() %>% html_nodes(xpath = '//*[@id="countyBent"]/div/div/div[1]/table') %>% html_table())
Bent.rep <- as.data.frame(co %>% html() %>% html_nodes(xpath = '//*[@id="countyBent"]/div/div/div[2]/table') %>% html_table())
Bent.dist <- rbind(Bent.dem, Bent.rep)
Bent.dist$co.district <- "Bent"

Boulder.dem <- as.data.frame(co %>% html() %>% html_nodes(xpath = '//*[@id="countyBoulder"]/div/div/div[1]/table') %>% html_table())
Boulder.rep <- as.data.frame(co %>% html() %>% html_nodes(xpath = '//*[@id="countyBoulder"]/div/div/div[2]/table') %>% html_table())
Boulder.dist <- rbind(Boulder.dem, Boulder.rep)
Boulder.dist$co.district <- "Boulder"

Broomfield.dem <- as.data.frame(co %>% html() %>% html_nodes(xpath = '//*[@id="countyBroomfield"]/div/div/div[1]/table') %>% html_table())
Broomfield.rep <- as.data.frame(co %>% html() %>% html_nodes(xpath = '//*[@id="countyBroomfield"]/div/div/div[2]/table') %>% html_table())
Broomfield.dist <- rbind(Broomfield.dem, Broomfield.rep)
Broomfield.dist$co.district <- "Broomfield"

Chaffee.dem <- as.data.frame(co %>% html() %>% html_nodes(xpath = '//*[@id="countyChaffee"]/div/div/div[1]/table') %>% html_table())
Chaffee.rep <- as.data.frame(co %>% html() %>% html_nodes(xpath = '//*[@id="countyChaffee"]/div/div/div[2]/table') %>% html_table())
Chaffee.dist <- rbind(Chaffee.dem, Chaffee.rep)
Chaffee.dist$co.district <- "Chaffee"

Cheyenne.dem <- as.data.frame(co %>% html() %>% html_nodes(xpath = '//*[@id="countyCheyenne"]/div/div/div[1]/table') %>% html_table())
Cheyenne.rep <- as.data.frame(co %>% html() %>% html_nodes(xpath = '//*[@id="countyCheyenne"]/div/div/div[2]/table') %>% html_table())
Cheyenne.dist <- rbind(Cheyenne.dem, Cheyenne.rep)
Cheyenne.dist$co.district <- "Cheyenne"

#problem
ClearCreek.dem <- as.data.frame(co %>% html() %>% html_nodes(xpath = '//*[@id="countyClearCreek"]/div/div/div[1]/table') %>% html_table())
ClearCreek.rep <- as.data.frame(co %>% html() %>% html_nodes(xpath = '//*[@id="countyClearCreek"]/div/div/div[2]/table') %>% html_table())
ClearCreek.dist <- rbind(ClearCreek.dem, ClearCreek.rep)
ClearCreek.dist$co.district <- "ClearCreek"

Conejos.dem <- as.data.frame(co %>% html() %>% html_nodes(xpath = '//*[@id="countyConejos"]/div/div/div[1]/table') %>% html_table())
Conejos.rep <- as.data.frame(co %>% html() %>% html_nodes(xpath = '//*[@id="countyConejos"]/div/div/div[2]/table') %>% html_table())
Conejos.dist <- rbind(Conejos.dem, Conejos.rep)
Conejos.dist$co.district <- "Conejos"

Costilla.dem <- as.data.frame(co %>% html() %>% html_nodes(xpath = '//*[@id="countyCostilla"]/div/div/div[1]/table') %>% html_table())
Costilla.rep <- as.data.frame(co %>% html() %>% html_nodes(xpath = '//*[@id="countyCostilla"]/div/div/div[2]/table') %>% html_table())
Costilla.dist <- rbind(Costilla.dem, Costilla.rep)
Costilla.dist$co.district <- "Costilla"

