# The Economists plot

# Library
library(ggplot2)
library(ggpubr)
library(ggthemes)
library(dplyr)
library(scales)


# Dataset
df = read.csv('TEDtalks.csv', header=1)


# Top five views
views = df %>% 
  arrange(desc(views)) %>%
  slice(1:5)


# Barplot most viewed

png("theeconomist.png", units="in", width=23, height=10, res=300, bg="transparent")

ggplot(views, aes(x=reorder(title,views), y=views)) + 
  geom_bar(stat = "identity", fill="#2171b5") +
  expand_limits(x = c(0, NA), y = c(0, NA)) +
  scale_y_continuous(labels = unit_format(unit = "M", scale = 1e-6)) +
  coord_flip() +
  labs() +
  labs(title="The most popular TED talks",
       subtitle="The five most viewed talks that you and your fellow TED fans can't stop sharing",
       caption="Source: TED Talks\n@melisadigiacomo | DAY12 #30DayChartChallenge April 2022",
       x = NULL,
       y = NULL) +
  theme_economist(
    base_size = 10,
    base_family = "sans",
    horizontal = TRUE,
    dkpanel = FALSE
  ) +
  theme(text = element_text(size = 30),
        axis.text = element_text(size = 20))

dev.off()

################

# Top five likes
likes = df %>% 
  arrange(desc(likes)) %>%
  slice(1:5)

# Barplot likes
ggplot(likes, aes(x=reorder(title,likes), y=likes)) + 
  geom_bar(stat = "identity", fill="#2171b5") +
  coord_flip() +
  labs(title = "The most popular TED talks",
       subtitle = "These 5 talks are the ones that you and your fellow TED fans just can't stop sharing",
       caption = "Source: TED Talks",
       x = NULL,
       y = NULL) +
  theme_economist_white(
    base_size = 11,
    base_family = "sans",
    gray_bg = TRUE,
    horizontal = TRUE
  )