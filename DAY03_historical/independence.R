# Independence

# Library
library(ggplot2)

# Dataset
independence = read.csv("independence.csv", header=T)
independence$country = with(independence, reorder(country, year))

# Horizontal lollipop
png("independence.png", units="in", width=25, height=15, res=300, bg="transparent")

ggplot(independence, aes(x=country, y=year)) +
  geom_segment(aes(x = country, xend = country, y = 1750, yend = year), color = "grey", size = 20) +
  geom_point(color="black", size = 20, alpha = 0.6) +
  geom_text(aes(x = country, y = year, label = date_mdy), 
          hjust = -0.2, size = 12,
          position = position_dodge(width = 1),
          inherit.aes = TRUE) +
  scale_y_continuous(limits = c(1750, 2200)) +
  labs(title="INDEPENDENCE DAY",
       caption="@melisadigiacomo\nDAY03 #30DayChartChallenge April 2022") +
  theme_light() +
  coord_flip() +
  theme(text = element_text(size = 40),
        axis.text = element_text(size = 40),
        axis.text.x = element_blank(),
        axis.title = element_blank(),
        panel.grid.major.y = element_blank(),
        panel.border = element_blank(),
        axis.ticks.y = element_blank()
  )

dev.off()