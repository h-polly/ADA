#import data
library(readr)
library(tidyverse)
brfss17 <- read_csv("https://raw.githubusercontent.com/kijohnson/ADA-Fall-2021/master/BRFSS2017_10percent_v.csv") %>%
  na.omit()

#summary stats
summary(brfss17)

#remove NA values from sex 
brfss17$SEX <- factor(brfss17$SEX)
levels(brfss17$SEX) <- c("male", "female", NA)
table(brfss17$SEX)

#subset by sex
males<-brfss17[which(brfss17$SEX== "male"),]
females <- brfss17[which(brfss17$SEX== "female"),]

#find height median
median(males$ht_meters, na.rm=TRUE)
median(females$ht_meters, na.rm=TRUE)

library(ggplot2)
library(RColorBrewer)

#create boxplot
ggplot(data = na.omit(brfss17), aes(x = SEX, y = ht_meters))+
  geom_boxplot() +
  labs(x = "Sex", y="Heigh in meters", title = "Median Height Boxplot") +
  scale_color_brewer(palette = "Accent")

#mean height
mean(males$ht_meters, na.rm=TRUE)
mean(females$ht_meters, na.rm=TRUE)
