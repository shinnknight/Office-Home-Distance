library(shiny)
library(leaflet)
library(dplyr)
library(tidyr)
library(tidyverse)
#load data
df = read.csv("./data_leave_stay_predictors.csv", stringsAsFactors = F)
# head(df)
#convert location1 into latitude and longtitude
# df <- tidyr::separate(data=df,
#                       col=Lat_Lng_Office,
#                       into=c("Latitude", "Longitude"),
#                       sep=",",
#                       remove=FALSE)

df <- tidyr::separate(data=df,
                      col=Lat_Lng_Home,
                      into=c("Latitude", "Longitude"),
                      sep=",",
                      remove=FALSE)
#remove "or" in column name
df$Latitude <- stringr::str_replace_all(df$Latitude, "[(]", "")
df$Longitude <- stringr::str_replace_all(df$Longitude, "[)]", "")

#convert string to numeric
df$Latitude <- as.numeric(df$Latitude)
df$Longitude <- as.numeric(df$Longitude)

# df <- mutate(df, count)

df_1 <- df %>% filter(
  is.na(df$Latitude)==FALSE &
    is.na(df$Longitude)==FALSE)

 
# content <- paste("ID:", df_1$ID,"<br/>",
#                  "Business Unit:",df_1$Business.Unit,"<br/>",
#                  "Job Title:", df_1$Job.Title,"<br/>") 
# 
# m1=leaflet(df_1) %>%
#   addProviderTiles("CartoDB.Positron") %>%
#   addCircles(lng = ~Longitude, lat = ~Latitude, color = "pink", weight = 1, popup = content)
# m1
# 
# Set1 <- c("pink", "yellow", "orange", "red","brown","darkred")
# pal = colorFactor(c("pink", "yellow", "orange", "red","brown","darkred"), domain = df_1$Business.Unit) 
# color_offsel1 = pal(df_1$Business.Unit)
# 
# m2=leaflet(df_1) %>%
#   addProviderTiles("CartoDB.Positron") %>%
#   addCircleMarkers(lng = ~Longitude, lat = ~Latitude, color = color_offsel1, radius=0.1, popup = content, stroke = TRUE, fillOpacity = 0)
# 
# m2 %>% addLegend(pal = pal, values = ~df_1$Business.Unit, title = "Business Unit")
# 
# mclust2 <- m2 %>% addCircleMarkers(clusterOptions = markerClusterOptions())
# 
# mclust2

saveRDS(df_1, "./data.rds")

#sample
# sample_data <- df[c(1:1000),]
# saveRDS(sample_data, "./sample_data.rds")
