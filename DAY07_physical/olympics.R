# Olympics

# DAY07 #30DayChartChallenge April 2022
# Physical

# Libraries
library(ggplot2)
library(ggExtra)

# Data
olympics <- readr::read_csv('https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2021/2021-07-27/olympics.csv')
olympics = data.frame(olympics$name,olympics$height,olympics$weight)
olympics = na.omit(olympics)
olympics = olympics[!duplicated(olympics), ]

# Create a scatter plot
p <- ggplot(olympics, aes(x=olympics.weight, y=olympics.height)) +
  geom_point(colour = "#FCB131", size = 3, alpha = 0.6) +
  xlab("Weight (kg)") + ylab("Height (cm)") + 
  theme_bw()

# Add density distribution as marginal plot
ggMarginal(p, type = "densigram")

# Using ggpubr
library(ggpubr)

# Grouped Scatter plot with marginal density plots
ggscatterhist(
  olympics, x = "olympics.weight", y = "olympics.height",
  size = 3, alpha = 0.6,
  margin.params = list(color = "black", size = 0.2)
)