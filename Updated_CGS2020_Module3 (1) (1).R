library(tidyverse)
library(haven)
view(airquality)
mean(airquality$Ozone)
head(airquality)
mean(airquality$Ozone,na.rm = TRUE)

air <- airquality
air$Ozone=ifelse(is.na(air$Ozone),median(air$Ozone, na.rm = TRUE),air$Ozone)
summary(air)

max(air$Solar.R, na.rm = TRUE)
air$Month <- gsub(5, "May", air$Month)
air$Month <- gsub(5, "JMay", air$Month)
#head(air)
air


air <- airquality
air$Ozone=ifelse(is.na(air2$Ozone),median(air$Ozone, na.rm = TRUE),air$Ozone)
summary(air)

#max(air2$Solar.R, na.rm = TRUE)
#ask for the entire table, not just the head of air, then you'll see the month changed
#if you use head it will only show the first 5 rows of the table so you only see May
air$Month <- gsub(6, "June", air$Month)
air$Month <- gsub(6, "June", air$Month)
air

# if you want to print specific columns first create a data frame

airdf = as.data.frame(air)

airdf[, c("Month", "Day")]


air$Solar.R[is.na(air$Solar.R)] <- mean(air$Solar.R, na.rm = TRUE)
air$Month <- gsub(5, "may" , air$Month)
air$Month <- gsub(6, "June", air$Month)
air$Month <- gsub(7, "July", air$Month)
air$Month <- gsub(8, "August", air$Month)
air$Month <- gsub(9, "September", air$Month)
summary(air1)

