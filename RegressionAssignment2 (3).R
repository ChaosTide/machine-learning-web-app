library(ggplot2)
library(dplyr)
library(broom)
library(ggpubr)

data("marketing", package = "datarium")
head(marketing, 4) # Show the first 4 rows of data

summary(marketing)
plot(sales ~ facebook, data = marketing)

sales.facebook.lm <- lm(sales ~ facebook, data = marketing)

summary(sales.facebook.lm)



#Plot the data points on a graph
sales.graph<-ggplot(marketing, aes(x=sales, y=facebook))+
  geom_point()
sales.graph

#Add the regression line to the plot
sales.graph <- sales.graph + geom_smooth(method="lm", col="black")
sales.graph

#Add the equation for the regresson line
sales.graph <- sales.graph +
  stat_regline_equation(label.x = 3, label.y = 110)

sales.graph


#Add titles and labels
sales.graph +
  theme_bw() +
  labs(title = "Reported sales y as a function of marketing budget for facebook x",
       x = "facebook marketing x ",
       y = "sales y")
       
